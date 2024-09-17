package student;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import rs.etf.sab.operations.VehicleOperations;

public class vk210524_vehicleOperations implements VehicleOperations {

	private Connection conn;
	
	public vk210524_vehicleOperations() {
		conn = DB.getInstance().getConnection();
	}
	
	@Override
	protected void finalize() throws Throwable {
		conn.close();
	}
	
	@Override
	public boolean changeConsumption(String licensePlateNumber, BigDecimal fuelConsumption) {
		String updateQuery = "UPDATE Vehicle SET Consumption = ? WHERE Registration = ?";
	    try (PreparedStatement pstmt = conn.prepareStatement(updateQuery)) {
	        pstmt.setBigDecimal(1, fuelConsumption);
	        pstmt.setString(2, licensePlateNumber);
	        
	        int affectedRows = pstmt.executeUpdate();
	        return affectedRows > 0;
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	        return false;
	    }
	}

	@Override
	public boolean changeFuelType(String licensePlateNumber, int fuelType) {
		String updateQuery = "UPDATE Vehicle SET FuelType = ? WHERE Registration = ?";
	    try (PreparedStatement pstmt = conn.prepareStatement(updateQuery)) {
	        pstmt.setInt(1, fuelType);
	        pstmt.setString(2, licensePlateNumber);
	        
	        int affectedRows = pstmt.executeUpdate();
	        return affectedRows > 0;
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	        return false;
	    }
	}

	@Override
	public int deleteVehicles(String... licencePlateNumbers) {
		if (licencePlateNumbers == null || licencePlateNumbers.length == 0) {
	        return 0;
	    }
	    
	    StringBuilder sb = new StringBuilder("DELETE FROM Vehicle WHERE Registration IN (");
	    for (int i = 0; i < licencePlateNumbers.length; i++) {
	        sb.append("?");
	        if (i < licencePlateNumbers.length - 1) {
	            sb.append(", ");
	        }
	    }
	    sb.append(")");
	    
	    try (PreparedStatement pstmt = conn.prepareStatement(sb.toString())) {
	        for (int i = 0; i < licencePlateNumbers.length; i++) {
	            pstmt.setString(i + 1, licencePlateNumbers[i]);
	        }
	        
	        return pstmt.executeUpdate();
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	        return -1;
	    }
	}

	@Override
	public List<String> getAllVehichles() {
		List<String> licencePlateNumbers = new ArrayList<>();
	    String query = "SELECT Registration FROM Vehicle";
	    try (Statement stmt = conn.createStatement();
	         ResultSet rs = stmt.executeQuery(query)) {
	        while (rs.next()) {
	            licencePlateNumbers.add(rs.getString("Registration"));
	        }
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	    }
	    return licencePlateNumbers;
	}

	@Override
	public boolean insertVehicle(String licencePlateNumber, int fuelType, BigDecimal fuelConsumption) {
		String insertQuery = "INSERT INTO Vehicle (Registration, FuelType, Consumption) VALUES (?, ?, ?)";
	    try (PreparedStatement pstmt = conn.prepareStatement(insertQuery)) {
	        pstmt.setString(1, licencePlateNumber);
	        pstmt.setInt(2, fuelType);
	        pstmt.setBigDecimal(3, fuelConsumption);
	        
	        int affectedRows = pstmt.executeUpdate();
	        return affectedRows > 0;
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	        return false;
	    }
	}

}
