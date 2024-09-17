package student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import rs.etf.sab.operations.DistrictOperations;

public class vk210524_districtOperations implements DistrictOperations {
	
	private Connection conn;
	
	public vk210524_districtOperations() {
		conn = DB.getInstance().getConnection();
	}
	
	@Override
	protected void finalize() throws Throwable {
		conn.close();
	}
	
	@Override
	public int deleteAllDistrictsFromCity(String nameOfTheCity) {
		String deleteQuery = "DELETE FROM District WHERE CityId = (SELECT Id FROM City WHERE Name = ?)";
	    try (PreparedStatement pstmt = conn.prepareStatement(deleteQuery)) {
	        pstmt.setString(1, nameOfTheCity);
	        
	        return pstmt.executeUpdate();
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	        return -1;
	    }
	}

	@Override
	public boolean deleteDistrict(int idDistrict) {
		String deleteQuery = "DELETE FROM District WHERE Id = ?";
	    try (PreparedStatement pstmt = conn.prepareStatement(deleteQuery)) {
	        pstmt.setInt(1, idDistrict);
	        
	        int affectedRows = pstmt.executeUpdate();
	        return affectedRows > 0;
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	        return false;
	    }
	}

	@Override
	public int deleteDistricts(String... names) {
		if (names == null || names.length == 0) {
	        return 0;
	    }
	    
	    StringBuilder sb = new StringBuilder("DELETE FROM District WHERE Name IN (");
	    for (int i = 0; i < names.length; i++) {
	        sb.append("?");
	        if (i < names.length - 1) {
	            sb.append(", ");
	        }
	    }
	    sb.append(")");
	    
	    try (PreparedStatement pstmt = conn.prepareStatement(sb.toString())) {
	        for (int i = 0; i < names.length; i++) {
	            pstmt.setString(i + 1, names[i]);
	        }
	        
	        return pstmt.executeUpdate();
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	        return -1;
	    }
	}

	@Override
	public List<Integer> getAllDistricts() {
		String query = "SELECT Id FROM District";
	    List<Integer> districtIds = new ArrayList<>();
	    try (PreparedStatement pstmt = conn.prepareStatement(query)) {
	        try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
	                districtIds.add(rs.getInt("Id"));
	            }
	        }
	        return districtIds;
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	        return null;
	    }
	}

	@Override
	public List<Integer> getAllDistrictsFromCity(int idCity) {
		String query = "SELECT Id FROM District WHERE CityId = ?";
	    List<Integer> districtIds = new ArrayList<>();
	    try (PreparedStatement pstmt = conn.prepareStatement(query)) {
	        pstmt.setInt(1, idCity);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
	                districtIds.add(rs.getInt("Id"));
	            }
	        }
	        if (districtIds.isEmpty()) {
	            return null;
	        }
	        return districtIds;
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	        return null;
	    }
	}

	@Override
	public int insertDistrict(String name, int cityId, int xCord, int yCord) {
		String insertQuery = "INSERT INTO District (Name, CityId, X, Y) VALUES (?, ?, ?, ?)";
	    try (PreparedStatement pstmt = conn.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS)) {
	        pstmt.setString(1, name);
	        pstmt.setInt(2, cityId);
	        pstmt.setInt(3, xCord);
	        pstmt.setInt(4, yCord);
	        
	        int affectedRows = pstmt.executeUpdate();
	        if (affectedRows == 0) {
	            throw new SQLException("Creating district failed, no rows affected.");
	        }
	        
	        try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
	            if (generatedKeys.next()) {
	                return generatedKeys.getInt(1);
	            } else {
	                throw new SQLException("Creating district failed, no ID obtained.");
	            }
	        }
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	        return -1;
	    }
	}

}
