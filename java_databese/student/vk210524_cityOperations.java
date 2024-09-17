package student;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


import rs.etf.sab.operations.CityOperations;

public class vk210524_cityOperations implements CityOperations {

	private Connection conn;
	
	public vk210524_cityOperations() {
		conn = DB.getInstance().getConnection();
	}
	
	@Override
	protected void finalize() throws Throwable {
		conn.close();
	}
	
	@Override
	public int deleteCity(String... names) {
		if (names == null || names.length == 0) {
	        return 0;
	    }
	    
	    PreparedStatement stmt = null;
	    int deletedRecords = 0;
	    
	    try {
	        String inClause = String.join(",", Collections.nCopies(names.length, "?"));
	        String sql = "DELETE FROM City WHERE Name IN (" + inClause + ")";
	        
	        stmt = conn.prepareStatement(sql);
	        
	        for (int i = 0; i < names.length; i++) {
	            stmt.setString(i + 1, names[i]);
	        }
	        
	        deletedRecords = stmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        if (stmt != null) try { stmt.close(); } catch (SQLException logOrIgnore) {}
	    }
	    
	    return deletedRecords;
	}

	@Override
	public boolean deleteCity(int idCity) {
		PreparedStatement stmt = null;
	    boolean success = false;
	    
	    try {
	        String sql = "DELETE FROM City WHERE Id = ?";
	        stmt = conn.prepareStatement(sql);
	        
	        stmt.setInt(1, idCity);
	        
	        int affectedRows = stmt.executeUpdate();
	        
	        success = affectedRows == 1;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        if (stmt != null) try { stmt.close(); } catch (SQLException logOrIgnore) {}
	    }
	    
	    return success;
	}

	@Override
	public List<Integer> getAllCities() {
		List<Integer> cityIds = new ArrayList<>();
	    Statement stmt = null;
	    ResultSet rs = null;
	    
	    try {
	        String sql = "SELECT Id FROM City";
	        stmt = conn.createStatement();
	        rs = stmt.executeQuery(sql);
	        
	        while (rs.next()) {
	            cityIds.add(rs.getInt("Id"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        if (rs != null) try { rs.close(); } catch (SQLException logOrIgnore) {}
	        if (stmt != null) try { stmt.close(); } catch (SQLException logOrIgnore) {}
	    }
	    
	    return cityIds;
	}

	@Override
	public int insertCity(String arg0, String arg1) {
		PreparedStatement stmt = null;
	    try {
	        String sql = "INSERT INTO City (Name, PostalCode) VALUES (?, ?)";
	        stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	        
	        stmt.setString(1, arg0);
	        stmt.setString(2, arg1);
	        
	        int affectedRows = stmt.executeUpdate();
	        
	        if (affectedRows == 0) {
	            throw new SQLException("Creating city failed, no rows affected.");
	        }
	        
	        try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
	            if (generatedKeys.next()) {
	                return generatedKeys.getInt(1);
	            } else {
	                throw new SQLException("Creating city failed, no ID obtained.");
	            }
	        }
	    } catch (SQLException e) {
	        return -1;
	    } finally {
	        if (stmt != null) try { stmt.close(); } catch (SQLException logOrIgnore) {}
	    }
	}

}
