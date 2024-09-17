package student;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import rs.etf.sab.operations.CourierOperations;

public class vk210524_courierOperations implements CourierOperations {

	private Connection conn;
	
	public vk210524_courierOperations() {
		conn = DB.getInstance().getConnection();
	}
	
	@Override
	protected void finalize() throws Throwable {
		conn.close();
	}
	
	@Override
	public boolean deleteCourier(String courierUserName) {
	    PreparedStatement pstmt = null;
	    try {
	        String getCourierIdSql = "SELECT Id FROM [User] WHERE Username = ?";
	        pstmt = conn.prepareStatement(getCourierIdSql);
	        pstmt.setString(1, courierUserName);
	        ResultSet rs = pstmt.executeQuery();
	        Integer courierId = null;
	        if (rs.next()) {
	            courierId = rs.getInt("Id");
	        }
	        rs.close();
	        pstmt.close();

	        if (courierId == null) {
	            return false;
	        }

	        String deleteCourierSql = "DELETE FROM Courier WHERE Id = ?";
	        pstmt = conn.prepareStatement(deleteCourierSql);
	        pstmt.setInt(1, courierId);
	        int affectedRows = pstmt.executeUpdate();
	        pstmt.close();

	        if (affectedRows == 0) {
	            return false;
	        }

	        String deleteUserSql = "DELETE FROM [User] WHERE Id = ?";
	        pstmt = conn.prepareStatement(deleteUserSql);
	        pstmt.setInt(1, courierId);
	        pstmt.executeUpdate();
	        pstmt.close();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (pstmt != null) {
	                pstmt.close();
	            }
	            if (conn != null) {
	                conn.close();
	            }
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return true;
	}

	@Override
	public List<String> getAllCouriers() {
		List<String> couriers = new ArrayList<>();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	        String sql = "SELECT Id FROM Courier ORDER BY Profit DESC";
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	        	Integer courierId = rs.getInt("Id");
				String sql2 = "SELECT Username FROM [User] WHERE Id = ?";
				PreparedStatement pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setInt(1, courierId);
				ResultSet rs2 = pstmt2.executeQuery();
				if (rs2.next()) {
	            	couriers.add(rs2.getString("Username"));
				}
	        }
	    } catch (SQLException ex) {
	        ex.printStackTrace();
	    } finally {
	        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
	        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
	    }
	    return couriers;
	}

	@Override
	public BigDecimal getAverageCourierProfit(int numberOfDeliveries) {
		BigDecimal averageProfit = BigDecimal.ZERO;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	        String sql = "SELECT AVG(Profit) AS AverageProfit FROM Courier WHERE DeliveredPackages >= ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, numberOfDeliveries);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            averageProfit = rs.getBigDecimal("AverageProfit");
	            if (averageProfit == null) {
	                averageProfit = BigDecimal.ZERO;
	            }
	        }
	    } catch (SQLException ex) {
	        ex.printStackTrace();
	    } finally {
	        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
	        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
	    }
	    return averageProfit;
	}

	@Override
	public List<String> getCouriersWithStatus(int statusOfCourier) {
		List<String> couriersWithStatus = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT Id FROM Courier WHERE StatusDriving = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, statusOfCourier);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                couriersWithStatus.add(rs.getString("Id"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        }
        return couriersWithStatus;
	}

	@Override
	public boolean insertCourier(String courierUserName, String licencePlateNumber) {
		PreparedStatement pstmt = null;
	    boolean success = false;
	    try {
	        String getUserIdSql = "SELECT Id FROM [User] WHERE Username = ?";
	        pstmt = conn.prepareStatement(getUserIdSql);
	        pstmt.setString(1, courierUserName);
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

	        String getVehicleIdSql = "SELECT Id FROM Vehicle WHERE Registration = ?";
	        pstmt = conn.prepareStatement(getVehicleIdSql);
	        pstmt.setString(1, licencePlateNumber);
	        rs = pstmt.executeQuery();
	        Integer vehicleId = null;
	        if (rs.next()) {
	            vehicleId = rs.getInt("Id");
	        }
	        rs.close();
	        pstmt.close();

	        if (vehicleId == null) {
	            return false;
	        }

	        String insertCourierSql = "INSERT INTO Courier (Id, VehicleId, DeliveredPackages, Profit, StatusDriving) VALUES (?, ?, 0, 0.000, 0)";
	        pstmt = conn.prepareStatement(insertCourierSql);
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
