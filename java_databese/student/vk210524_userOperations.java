package student;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


import rs.etf.sab.operations.UserOperations;

public class vk210524_userOperations implements UserOperations {

	private Connection conn;
	
	public vk210524_userOperations() {
		conn = DB.getInstance().getConnection();
	}
	
	@Override
	protected void finalize() throws Throwable {
		conn.close();
	}
	
	@Override
	public int declareAdmin(String userName) {
	    String checkUserQuery = "SELECT Id FROM [User] WHERE Username = ?";
	    Integer userId = null;
	    try (PreparedStatement checkStmt = conn.prepareStatement(checkUserQuery)) {
	        checkStmt.setString(1, userName);
	        ResultSet rs = checkStmt.executeQuery();
	        if (rs.next()) {
	            userId = rs.getInt("Id");
	        } else {
	            return 2;
	        }
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	        return 2;
	    }

	    String checkAdminQuery = "SELECT COUNT(*) FROM [Admin] WHERE Id = ?";
	    try (PreparedStatement checkAdminStmt = conn.prepareStatement(checkAdminQuery)) {
	        checkAdminStmt.setInt(1, userId);
	        ResultSet rs = checkAdminStmt.executeQuery();
	        if (rs.next() && rs.getInt(1) > 0) {
	            return 1;
	        }
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	        return 2;
	    }
	    
	    String insertAdminQuery = "INSERT INTO [Admin] (Id) VALUES (?)";
	    try (PreparedStatement insertAdminStmt = conn.prepareStatement(insertAdminQuery)) {
	        insertAdminStmt.setInt(1, userId);
	        insertAdminStmt.executeUpdate();
	        return 0;
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	        return 2;
	    }
	}

	@Override
	public int deleteUsers(String... userNames) {
		if (userNames == null || userNames.length == 0) {
	        return 0;
	    }
	    String inSql = String.join(",", Collections.nCopies(userNames.length, "?"));
	    String query = "DELETE FROM [User] WHERE Username IN (" + inSql + ")";
	    
	    try (PreparedStatement stmt = conn.prepareStatement(query)) {
	        for (int i = 0; i < userNames.length; i++) {
	            stmt.setString(i + 1, userNames[i]);
	        }
	        
	        int affectedRows = stmt.executeUpdate();
	        return affectedRows;
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	        return 0;
	    }
	}

	@Override
	public List<String> getAllUsers() {
		List<String> userNames = new ArrayList<>();
	    String query = "SELECT Username FROM [User]";
	    
	    try (Statement stmt = conn.createStatement();
	         ResultSet rs = stmt.executeQuery(query)) {
	        while (rs.next()) {
	            userNames.add(rs.getString("Username"));
	        }
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	    }
	    return userNames;
	}

	@Override
	public Integer getSentPackages(String... userNames) {
		if (userNames == null || userNames.length == 0) {
	        return null;
	    }
	    String inSql = String.join(",", Collections.nCopies(userNames.length, "?"));
	    String query = "SELECT SUM(SentPackages), COUNT(DISTINCT Username) FROM [User] WHERE Username IN (" + inSql + ")";
	    
	    try (PreparedStatement stmt = conn.prepareStatement(query)) {
	        for (int i = 0; i < userNames.length; i++) {
	            stmt.setString(i + 1, userNames[i]);
	        }
	        
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            int userCount = rs.getInt(2);
	            if (userCount == 0) {
	                return null;
	            }
	            int sum = rs.getInt(1);
	            return sum; 
	        }
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	    }
	    return null;
	}

	@Override
	public boolean insertUser(String userName, String firstName, String lastName, String password) {
	    if (password.length() < 8 || !password.matches(".*[0-9].*") || !password.matches(".*[A-Za-z].*")) {
	        return false;
	    }
	    if (!Character.isUpperCase(firstName.charAt(0)) || !Character.isUpperCase(lastName.charAt(0))) {
	        return false;
	    }
	    String checkUserQuery = "SELECT COUNT(*) FROM [User] WHERE Username = ?";
	    try (PreparedStatement checkStmt = conn.prepareStatement(checkUserQuery)) {
	        checkStmt.setString(1, userName);
	        ResultSet rs = checkStmt.executeQuery();
	        if (rs.next() && rs.getInt(1) > 0) {
	            return false;
	        }
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	        return false;
	    }
	    String insertQuery = "INSERT INTO [User] (Username, FirstName, Surname, Password) VALUES (?, ?, ?, ?)";
	    try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
	        insertStmt.setString(1, userName);
	        insertStmt.setString(2, firstName);
	        insertStmt.setString(3, lastName);
	        insertStmt.setString(4, password);
	        int affectedRows = insertStmt.executeUpdate();
	        return affectedRows > 0;
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	        return false;
	    }
	}

	
	public static void main(String[] args) {
		vk210524_generalOperations go = new vk210524_generalOperations();
		go.eraseAll();
		vk210524_userOperations uo = new vk210524_userOperations();
		String username = "rope";
	      System.out.println(uo.getSentPackages(new String[]{username}));
	}
}
