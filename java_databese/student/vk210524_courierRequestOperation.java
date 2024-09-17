package student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import rs.etf.sab.operations.CourierRequestOperation;

public class vk210524_courierRequestOperation implements CourierRequestOperation {

	private Connection conn;
	
	public vk210524_courierRequestOperation() {
		conn = DB.getInstance().getConnection();
	}
	
	@Override
	protected void finalize() throws Throwable {
		conn.close();
	}
	
	@Override
	public boolean changeVehicleInCourierRequest(String userName, String Registration) {
		PreparedStatement pstmt = null;
	    boolean success = false;
	    try {
	        String getUserIdSql = "SELECT Id FROM [User] WHERE Username = ?";
	        pstmt = conn.prepareStatement(getUserIdSql);
	        pstmt.setString(1, userName);
	        ResultSet rsUser = pstmt.executeQuery();
	        Integer userId = null;
	        if (rsUser.next()) {
	            userId = rsUser.getInt("Id");
	        }
	        rsUser.close();
	        pstmt.close();

	        if (userId == null) {
	            return false;
	        }

	        String getVehicleIdSql = "SELECT Id FROM Vehicle WHERE Registration = ?";
	        pstmt = conn.prepareStatement(getVehicleIdSql);
	        pstmt.setString(1, Registration);
	        ResultSet rsVehicle = pstmt.executeQuery();
	        Integer vehicleId = null;
	        if (rsVehicle.next()) {
	            vehicleId = rsVehicle.getInt("Id");
	        }
	        rsVehicle.close();
	        pstmt.close();

	        if (vehicleId == null) {
	            return false;
	        }

	        String updateRequestSql = "UPDATE Request SET Vehicle = ? WHERE UserId = ?";
	        pstmt = conn.prepareStatement(updateRequestSql);
	        pstmt.setInt(1, vehicleId);
	        pstmt.setInt(2, userId);
	        int affectedRows = pstmt.executeUpdate();

	        success = affectedRows > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (pstmt != null) {
	                pstmt.close();
	            }
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return success;
	}

	@Override
	public boolean deleteCourierRequest(String userName) {
		PreparedStatement pstmt = null;
	    boolean success = false;
	    try {
	        String getUserIdSql = "SELECT Id FROM [User] WHERE Username = ?";
	        pstmt = conn.prepareStatement(getUserIdSql);
	        pstmt.setString(1, userName);
	        ResultSet rs = pstmt.executeQuery();
	        Integer userId = null;
	        if (rs.next()) {
	            userId = rs.getInt("Id");
	        }
	        rs.close();
	        pstmt.close();

	        if (userId == null) {
	            return false;
	        }

	        String deleteRequestSql = "DELETE FROM Request WHERE UserId = ?";
	        pstmt = conn.prepareStatement(deleteRequestSql);
	        pstmt.setInt(1, userId);
	        int affectedRows = pstmt.executeUpdate();

	        success = affectedRows > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (pstmt != null) {
	                pstmt.close();
	            }
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return success;
	}

	@Override
	public List<String> getAllCourierRequests() {
		List<String> courierRequests = new ArrayList<>();
	    Statement stmt = null;
	    ResultSet rs = null;
	    try {
	        String sql = "SELECT u.Username, v.Registration FROM Request r JOIN [User] u ON r.UserId = u.Id JOIN Vehicle v ON r.Vehicle = v.Id";
	        stmt = conn.createStatement();
	        rs = stmt.executeQuery(sql);
	        while (rs.next()) {
	            String requestDetail = "Username: " + rs.getString("Username") + ", Licence Plate: " + rs.getString("Registration");
	            courierRequests.add(requestDetail);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return courierRequests;
	}

	@Override
	public boolean grantRequest(String username) {
		CallableStatement cstmt = null;
	    boolean success = false;
	    try {
	    	String getRequestSql = "SELECT Id FROM Request WHERE Request.UserId IN (SELECT u.Id FROM [User] u WHERE u.Username = ?)";
	        PreparedStatement pstmt = conn.prepareStatement(getRequestSql);
	        pstmt.setString(1, username);
	        ResultSet rsRequest = pstmt.executeQuery();
	        Integer requestId = null;
	        if (rsRequest.next()) {
	            requestId = rsRequest.getInt("Id");
	        }
	        rsRequest.close();
	        pstmt.close();

	        if (requestId == null) {
	            return false;
	        }

	        String execProcedureSql = "{call OdbradaZahtevaPostajanjaKurira(?, ?)}";
	        cstmt = conn.prepareCall(execProcedureSql);
	        cstmt.setInt(1, requestId);
	        cstmt.setInt(2, 1);
	        cstmt.execute();

	        success = true;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (cstmt != null) {
	                cstmt.close();
	            }
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return success;
	}

	@Override
	public boolean insertCourierRequest(String userName, String Registration) {
		PreparedStatement pstmt = null;
	    boolean success = false;
	    try {
	        String getUserIdSql = "SELECT Id FROM [User] WHERE Username = ?";
	        pstmt = conn.prepareStatement(getUserIdSql);
	        pstmt.setString(1, userName);
	        ResultSet rsUser = pstmt.executeQuery();
	        Integer userId = null;
	        if (rsUser.next()) {
	            userId = rsUser.getInt("Id");
	        }
	        rsUser.close();
	        pstmt.close();

	        if (userId == null) {
	            return false;
	        }

	        String getVehicleIdSql = "SELECT Id FROM Vehicle WHERE Registration = ?";
	        pstmt = conn.prepareStatement(getVehicleIdSql);
	        pstmt.setString(1, Registration);
	        ResultSet rsVehicle = pstmt.executeQuery();
	        Integer vehicleId = null;
	        if (rsVehicle.next()) {
	            vehicleId = rsVehicle.getInt("Id");
	        }
	        rsVehicle.close();
	        pstmt.close();

	        if (vehicleId == null) {
	            return false;
	        }

	        String insertRequestSql = "INSERT INTO Request (UserId, Vehicle) VALUES (?, ?)";
	        pstmt = conn.prepareStatement(insertRequestSql);
	        pstmt.setInt(1, userId);
	        pstmt.setInt(2, vehicleId);
	        int affectedRows = pstmt.executeUpdate();

	        success = affectedRows > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (pstmt != null) {
	                pstmt.close();
	            }
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return success;
	}

}
