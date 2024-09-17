package student;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import rs.etf.sab.operations.PackageOperations;


public class vk210524_packageOperations implements PackageOperations {

	private Connection conn;
	private BigDecimal[] OSNOVNA_CENA;
	private BigDecimal[] TEZINSKI_FAKTOR;
	private BigDecimal[] CENA_PO_KG;
	private BigDecimal[] CENA_PO_LITRU;
	
	public vk210524_packageOperations() {
		conn = DB.getInstance().getConnection();
		OSNOVNA_CENA = new BigDecimal[]{new BigDecimal("10"), new BigDecimal("25"), new BigDecimal("75")};
		TEZINSKI_FAKTOR = new BigDecimal[]{BigDecimal.ZERO, BigDecimal.ONE, new BigDecimal("2")};
		CENA_PO_KG = new BigDecimal[]{BigDecimal.ZERO, new BigDecimal("100"), new BigDecimal("300")};
		CENA_PO_LITRU = new BigDecimal[]{new BigDecimal("15"), new BigDecimal("32"), new BigDecimal("36")};
	}
	
	@Override
	protected void finalize() throws Throwable {
		conn.close();
	}

	private BigDecimal calculateEuclideanDistance(Integer destinationDistrictId, Integer sourceDistrictId) {
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    BigDecimal euclideanDistance = null;
	    try {
	        String getCoordinatesSql = "SELECT X, Y FROM District WHERE Id = ?";
	        pstmt = conn.prepareStatement(getCoordinatesSql);
	        pstmt.setInt(1, sourceDistrictId);
	        rs = pstmt.executeQuery();
	        BigDecimal x1 = null;
	        BigDecimal y1 = null;
	        if (rs.next()) {
	            x1 = rs.getBigDecimal("X");
	            y1 = rs.getBigDecimal("Y");
	        }
	        rs.close();
	        pstmt.close();

	        pstmt = conn.prepareStatement(getCoordinatesSql);
	        pstmt.setInt(1, destinationDistrictId);
	        rs = pstmt.executeQuery();
	        BigDecimal x2 = null;
	        BigDecimal y2 = null;
	        if (rs.next()) {
	            x2 = rs.getBigDecimal("X");
	            y2 = rs.getBigDecimal("Y");
	        }
	        rs.close();
	        pstmt.close();

	        if (x1 == null || y1 == null || x2 == null || y2 == null) {
	            return null;
	        }

	        euclideanDistance = BigDecimal.valueOf(Math.sqrt(Math.pow(x2.subtract(x1).doubleValue(), 2) + Math.pow(y2.subtract(y1).doubleValue(), 2)));
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return euclideanDistance;
	}
	
	@Override
	public boolean acceptAnOffer(int offerId) {
		PreparedStatement pstmt = null;
    ResultSet rs = null;
    boolean success = false;
    try {
        conn.setAutoCommit(false);

        String selectOfferSql = "SELECT CourierId, PackageId, Percentage FROM [Offer] WHERE Id = ?";
        pstmt = conn.prepareStatement(selectOfferSql);
        pstmt.setInt(1, offerId);
        rs = pstmt.executeQuery();
        Integer courierId = null;
        Integer packageId = null;
        BigDecimal percentage = null;
        if (rs.next()) {
            courierId = rs.getInt("CourierId");
            packageId = rs.getInt("PackageId");
            percentage = rs.getBigDecimal("Percentage");
        }
        rs.close();
        pstmt.close();

        if (courierId == null || packageId == null) {
            conn.rollback(); 
            return false;
        }

        String getPackageDetailsSql = "SELECT Weight, DstDistrictId, SrcDistrictId, Type FROM [Package] WHERE Id = ?";
        pstmt = conn.prepareStatement(getPackageDetailsSql);
        pstmt.setInt(1, packageId);
        rs = pstmt.executeQuery();
        BigDecimal weight = null;
        Integer destinationDistrictId = null;
		Integer sourceDistrictId = null;
		Integer packageType = null;
        if (rs.next()) {
            weight = rs.getBigDecimal("Weight");
            destinationDistrictId = rs.getInt("DstDistrictId");
			sourceDistrictId = rs.getInt("SrcDistrictId");
			packageType = rs.getInt("Type");
        }
        rs.close();
        pstmt.close();

        BigDecimal euclideanDistance = calculateEuclideanDistance(destinationDistrictId, sourceDistrictId);

        BigDecimal newPrice = OSNOVNA_CENA[packageType].add(TEZINSKI_FAKTOR[packageType].multiply(weight).multiply(CENA_PO_KG[packageType]))
                .multiply(euclideanDistance).multiply(percentage);
        
        String updatePackageSql = "UPDATE [Package] SET CourierId = ?, DelieveryStatus = 1, Price = ?, AcceptanceTime = ? WHERE Id = ?";
        pstmt = conn.prepareStatement(updatePackageSql);
        pstmt.setInt(1, courierId);
        pstmt.setBigDecimal(2, newPrice);
		pstmt.setDate(3, new Date(System.currentTimeMillis()));
        pstmt.setInt(4, packageId);

        int affectedRows = pstmt.executeUpdate();

        if (affectedRows == 0) {
            conn.rollback();
            return false;
        }

        conn.commit();
        success = true;
    } catch (SQLException e) {
        try {
            if (conn != null) conn.rollback();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.setAutoCommit(true);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    return success;
	}

	@Override
	public boolean changeType(int packageId, int newType) {
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    boolean success = false;
	    try {
	        String checkStatusSql = "SELECT DelieveryStatus FROM Package WHERE Id = ?";
	        pstmt = conn.prepareStatement(checkStatusSql);
	        pstmt.setInt(1, packageId);
	        rs = pstmt.executeQuery();
	        if (rs.next() && rs.getInt("DelieveryStatus") == 0) {
	            String updateTypeSql = "UPDATE Package SET Type = ? WHERE Id = ?";
	            pstmt.close();
	            pstmt = conn.prepareStatement(updateTypeSql);
	            pstmt.setInt(1, newType);
	            pstmt.setInt(2, packageId);
	            int rowsAffected = pstmt.executeUpdate();
	            success = rowsAffected > 0;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return success;
	}

	@Override
	public boolean changeWeight(int packageId, BigDecimal newWeight) {
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    boolean success = false;
	    try {
	        String selectStatusSql = "SELECT DelieveryStatus FROM Package WHERE Id = ?";
	        pstmt = conn.prepareStatement(selectStatusSql);
	        pstmt.setInt(1, packageId);
	        rs = pstmt.executeQuery();
	        if (rs.next() && rs.getInt("DelieveryStatus") == 0) {
	            String updateWeightSql = "UPDATE Package SET Weight = ? WHERE Id = ?";
	            pstmt.close();
	            pstmt = conn.prepareStatement(updateWeightSql);
	            pstmt.setBigDecimal(1, newWeight);
	            pstmt.setInt(2, packageId);
	            int rowsAffected = pstmt.executeUpdate();
	            success = rowsAffected > 0;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return success;
	}

	@Override
	public boolean deletePackage(int packageId) {
		boolean isDeleted = false;
	    PreparedStatement pstmt = null;
	    try {
	        String deleteSql = "DELETE FROM Package WHERE Id = ?";
	        pstmt = conn.prepareStatement(deleteSql);
	        pstmt.setInt(1, packageId);
	        int rowsAffected = pstmt.executeUpdate();
	        if (rowsAffected > 0) {
	            isDeleted = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (pstmt != null) pstmt.close();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return isDeleted;
	}

	@Override
	public int driveNextPackage(String courierUserName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int packageId = -2;
		try {
			conn.setAutoCommit(false);
			
			String getCourierIdSql = "SELECT c.Id, c.VehicleId FROM Courier c JOIN [User] u ON c.Id = u.Id WHERE u.Username = ?";
			pstmt = conn.prepareStatement(getCourierIdSql);
			pstmt.setString(1, courierUserName);
			rs = pstmt.executeQuery();
			Integer courierId = null;
			Integer vehicleId = null;
			if (rs.next()) {
				courierId = rs.getInt("Id");
				vehicleId = rs.getInt("VehicleId");
			} else {
				conn.rollback();
				return -2;
			}
			rs.close();
			pstmt.close();

			String checkDrivingStatusSql = "SELECT COUNT(*) AS DrivingCouriers FROM Courier WHERE StatusDriving = 1 AND VehicleId = ? AND Id != ?";
			pstmt = conn.prepareStatement(checkDrivingStatusSql);
			pstmt.setInt(1, vehicleId);
			pstmt.setInt(2, courierId);
			rs = pstmt.executeQuery();
			if (rs.next() && rs.getInt("DrivingCouriers") > 0) {
				conn.rollback();
				return -2; 
			}
			rs.close();
			pstmt.close();

			// Check if there is an existing "Voznja" for the courier
			String checkVoznjaSql = "SELECT COUNT(*) AS ExistingVoznja FROM Voznja WHERE CourierId = ?";
			pstmt = conn.prepareStatement(checkVoznjaSql);
			pstmt.setInt(1, courierId);
			rs = pstmt.executeQuery();
			if (!rs.next() || rs.getInt("ExistingVoznja") == 0) {
				// Create a new "Voznja" for the courier
				String insertVoznjaSql = "INSERT INTO Voznja (CourierId) VALUES (?)";
				pstmt.close();
				pstmt = conn.prepareStatement(insertVoznjaSql);
				pstmt.setInt(1, courierId);
				pstmt.executeUpdate();

				// Retrieve all packages with DelieveryStatus = 1 for the courier, ordered by AcceptanceTime
				String getPackagesSql = "SELECT Id FROM Package WHERE CourierId = ? AND DelieveryStatus = 1 ORDER BY AcceptanceTime ASC";
				pstmt = conn.prepareStatement(getPackagesSql);
				pstmt.setInt(1, courierId);
				rs = pstmt.executeQuery();
				int count = 1;
				while (rs.next()) {
					packageId = rs.getInt("Id");
					// Insert each package into "Prevozi" with the count
					String insertPrevoziSql = "INSERT INTO Prevozi (PackageId, CourierId, count) VALUES (?, ?, ?)";
					try (PreparedStatement pstmtPrevozi = conn.prepareStatement(insertPrevoziSql)) {
						pstmtPrevozi.setInt(1, packageId);
						pstmtPrevozi.setInt(2, courierId);
						pstmtPrevozi.setInt(3, count++);
						pstmtPrevozi.executeUpdate();
					}
				}
				rs.close();
				pstmt.close();

				String updateCourierStatusSql = "UPDATE Courier SET StatusDriving = 1 WHERE Id = ?";
				pstmt = conn.prepareStatement(updateCourierStatusSql);
				pstmt.setInt(1, courierId);
				pstmt.executeUpdate();
			}
			rs.close();
			pstmt.close();
			
			packageId = -1;
			// Retrieve the first package from "Prevozi" for the courier
			String getFirstPackageSql = "SELECT TOP 1 PackageId, count FROM Prevozi WHERE CourierId = ? ORDER BY count ASC";
			pstmt = conn.prepareStatement(getFirstPackageSql);
			pstmt.setInt(1, courierId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				packageId = rs.getInt("PackageId");
				int count = rs.getInt("count");
				String updateFirstPackageSql = "UPDATE Package SET DelieveryStatus = 3 WHERE Id = ?"; // Delivered
				pstmt = conn.prepareStatement(updateFirstPackageSql);
				pstmt.setInt(1, packageId);
				pstmt.executeUpdate();

				// Remove the first package from "Prevozi"
				String deleteFirstPackageSql = "DELETE FROM Prevozi WHERE PackageId = ? AND count = ?";
				pstmt = conn.prepareStatement(deleteFirstPackageSql);
				pstmt.setInt(1, packageId);
				pstmt.setInt(2, count);
				pstmt.executeUpdate();

				// Calculate the price of the delivery
				Integer destinationDistricId = null;
				Integer sourceDistrictId = null;
				String getPackageDetailsSql = "SELECT DstDistrictId, SrcDistrictId, Type FROM [Package] WHERE Id = ?";
				pstmt = conn.prepareStatement(getPackageDetailsSql);
				pstmt.setInt(1, packageId);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					destinationDistricId = rs.getInt("DstDistrictId");
					sourceDistrictId = rs.getInt("SrcDistrictId");
				}

				
				String getPotrosnjaSql = "SELECT Consumption, FuelType FROM Vehicle WHERE Id = ?";
				pstmt = conn.prepareStatement(getPotrosnjaSql);
				pstmt.setInt(1, vehicleId);
				rs = pstmt.executeQuery();
				BigDecimal potrosnja = null;
				Integer fuelType = null;
				if (rs.next()) {
					potrosnja = rs.getBigDecimal("Consumption");
					fuelType = rs.getInt("FuelType");
				}
				
				String getPackagePrice = "SELECT Price FROM Package WHERE Id = ?";
				pstmt = conn.prepareStatement(getPackagePrice);
				pstmt.setInt(1, packageId);
				rs = pstmt.executeQuery();
				BigDecimal price = null;
				if (rs.next()) {
					price = rs.getBigDecimal("Price");
				}
				
				// Update zarada for the courier in Voznja
				String updateZaradaSql = "UPDATE Voznja SET Zarada = Zarada + ? WHERE CourierId = ?";
				pstmt = conn.prepareStatement(updateZaradaSql);
				BigDecimal distanca = calculateEuclideanDistance(destinationDistricId, sourceDistrictId);
				BigDecimal zarada = price.subtract(CENA_PO_LITRU[fuelType].multiply(potrosnja).multiply(distanca));
				pstmt.setBigDecimal(1, zarada);
				pstmt.setInt(2, courierId);
				pstmt.executeUpdate();

				pstmt = conn.prepareStatement(getFirstPackageSql);
				pstmt.setInt(1, courierId);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					Integer packageId2 = rs.getInt("PackageId");
					count = rs.getInt("count");
					String updateSecondPackageSql = "UPDATE Package SET DelieveryStatus = 2 WHERE Id = ?"; // In delivery
					pstmt = conn.prepareStatement(updateSecondPackageSql);
					pstmt.setInt(1, packageId2);
					pstmt.executeUpdate();
					
					sourceDistrictId = destinationDistricId;
					getPackageDetailsSql = "SELECT DstDistrictId FROM [Package] WHERE Id = ?";
					pstmt = conn.prepareStatement(getPackageDetailsSql);
					pstmt.setInt(1, packageId2);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						destinationDistricId = rs.getInt("DstDistrictId");
					}
					pstmt = conn.prepareStatement(updateZaradaSql);
					distanca = calculateEuclideanDistance(destinationDistricId, sourceDistrictId);
					zarada = CENA_PO_LITRU[fuelType].multiply(potrosnja).multiply(distanca);
					pstmt.setBigDecimal(1, zarada.negate());
					pstmt.setInt(2, courierId);
					pstmt.executeUpdate();
				}
				else{
					String updateCourierStatusSql = "UPDATE Courier SET StatusDriving = 0 WHERE Id = ?";
					pstmt = conn.prepareStatement(updateCourierStatusSql);
					pstmt.setInt(1, courierId);
					pstmt.executeUpdate();

					//Update Courier Profit
					String updateCourierProfitSql = "UPDATE Courier SET Profit = Profit + (SELECT Zarada FROM Voznja WHERE CourierId = ?) WHERE Id = ?";
					pstmt = conn.prepareStatement(updateCourierProfitSql);
					pstmt.setInt(1, courierId);
					pstmt.setInt(2, courierId);
					pstmt.executeUpdate();
					
				}
			}
			else{
				String deleteVoznjaSql = "DELETE FROM Voznja WHERE CourierId = ?";
				pstmt = conn.prepareStatement(deleteVoznjaSql);
				pstmt.setInt(1, courierId);
				pstmt.executeUpdate();

			}

			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			e.printStackTrace();
			packageId = -2;
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				conn.setAutoCommit(true);
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		return packageId;
	}

	@Override
	public Date getAcceptanceTime(int packageId) {
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    Date acceptanceTime = null;
	    try {
	        String selectAcceptanceTimeSql = "SELECT AcceptanceTime FROM Package WHERE Id = ?";
	        pstmt = conn.prepareStatement(selectAcceptanceTimeSql);
	        pstmt.setInt(1, packageId);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            acceptanceTime = rs.getDate("AcceptanceTime");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return acceptanceTime;
	}

	@Override
	public List<Integer> getAllOffers() {
		List<Integer> offerIds = new ArrayList<>();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	        String selectAllOffersSql = "SELECT Id FROM [Offer]";
	        pstmt = conn.prepareStatement(selectAllOffersSql);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            offerIds.add(rs.getInt("Id"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return offerIds;
	}

	@Override
	public List<Pair<Integer, BigDecimal>> getAllOffersForPackage(int packageId) {
		List<PackageOperations.Pair<Integer, BigDecimal>> offers = new ArrayList<>();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	        String selectOffersSql = "SELECT Id, Percentage FROM [Offer] WHERE PackageId = ?";
	        pstmt = conn.prepareStatement(selectOffersSql);
	        pstmt.setInt(1, packageId);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            int offerId = rs.getInt("Id");
	            BigDecimal percentage = rs.getBigDecimal("Percentage");
	            offers.add(new PackagePair(offerId, percentage));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return offers;
	}

	@Override
	public List<Integer> getAllPackages() {
		List<Integer> packageIds = new ArrayList<>();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	        String selectPackagesSql = "SELECT Id FROM Package";
	        pstmt = conn.prepareStatement(selectPackagesSql);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            int packageId = rs.getInt("Id");
	            packageIds.add(packageId);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return packageIds;
	}

	@Override
	public List<Integer> getAllPackagesWithSpecificType(int type) {
		List<Integer> packageIds = new ArrayList<>();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	        String selectPackagesSql = "SELECT Id FROM Package WHERE Type = ?";
	        pstmt = conn.prepareStatement(selectPackagesSql);
	        pstmt.setInt(1, type);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            int packageId = rs.getInt("Id");
	            packageIds.add(packageId);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return packageIds;
	}

	@Override
	public Integer getDeliveryStatus(int packageId) {
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	        String selectStatusSql = "SELECT DelieveryStatus FROM Package WHERE Id = ?";
	        pstmt = conn.prepareStatement(selectStatusSql);
	        pstmt.setInt(1, packageId);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            return rs.getInt("DelieveryStatus");
	        } else {
	            return null;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return null; 
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	}

	@Override
	public List<Integer> getDrive(String courierUsername) {
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<Integer> packageIds = new ArrayList<>();
	    try {
			String selectCourierIdSql = "SELECT Id FROM Courier WHERE UserId = (SELECT Id FROM [User] WHERE Username = ?)";
	        pstmt = conn.prepareStatement(selectCourierIdSql);
			pstmt.setString(1, courierUsername);
			rs = pstmt.executeQuery();
			Integer courierId = null;
			if (rs.next()) {
				courierId = rs.getInt("Id");
			}else {
				return null;
			}
			rs.close();
			pstmt.close();
	        String selectPackagesSql = "SELECT PackageId FROM Package WHERE CourierId = ? AND DeliveryStatus < 3";
	        pstmt = conn.prepareStatement(selectPackagesSql);
	        pstmt.setInt(1, courierId);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            packageIds.add(rs.getInt("PackageId"));
	        }
	        if (packageIds.isEmpty()) {
	            return null;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return null; 
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return packageIds; 
	}

	@Override
	public BigDecimal getPriceOfDelivery(int arg0) {
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    BigDecimal price = null;
	    try {
	        String selectPriceSql = "SELECT Price FROM Package WHERE Id = ?";
	        pstmt = conn.prepareStatement(selectPriceSql);
	        pstmt.setInt(1, arg0);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            price = rs.getBigDecimal("Price");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return price;
	}

	@Override
	public int insertPackage(int districtFrom, int districtTo, String userName, int packageType, BigDecimal weight) {
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int generatedId = -1;
	    try {
	        String checkDistrictSql = "SELECT COUNT(Id) AS DistrictCount FROM District WHERE Id IN (?, ?)";
	        pstmt = conn.prepareStatement(checkDistrictSql);
	        pstmt.setInt(1, districtFrom);
	        pstmt.setInt(2, districtTo);
	        rs = pstmt.executeQuery();
	        if (rs.next() && rs.getInt("DistrictCount") == 2) {
	            rs.close();
	            pstmt.close();
	        } else {
	            return -1;
	        }

	        String getUserIdSql = "SELECT Id FROM [User] WHERE Username = ?";
	        pstmt = conn.prepareStatement(getUserIdSql);
	        pstmt.setString(1, userName);
	        rs = pstmt.executeQuery();
	        Integer userId = null;
	        if (rs.next()) {
	            userId = rs.getInt("Id");
	        }
	        rs.close();
	        pstmt.close();

	        if (userId == null) {
	            return -1; 
	        }

	        String insertPackageSql = "INSERT INTO [Package] (SrcDistrictId, DstDistrictId, Type, Weight, CourierId) VALUES (?, ?, ?, ?, NULL)";
	        pstmt = conn.prepareStatement(insertPackageSql, Statement.RETURN_GENERATED_KEYS);
	        pstmt.setInt(1, districtFrom);
	        pstmt.setInt(2, districtTo);
	        pstmt.setInt(3, packageType);
	        pstmt.setBigDecimal(4, weight);
	        int affectedRows = pstmt.executeUpdate();

	        if (affectedRows == 0) {
	            return -1; 
	        }

	        rs = pstmt.getGeneratedKeys();
	        if (rs.next()) {
	            generatedId = rs.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return -1;
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return generatedId;
	}

	@Override
	public int insertTransportOffer(String couriersUserName, int packageId, BigDecimal pricePercentage) {
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int generatedId = -1;
	    try {
	        String getCourierIdSql = "SELECT Id FROM [User] WHERE Username = ?";
	        pstmt = conn.prepareStatement(getCourierIdSql);
	        pstmt.setString(1, couriersUserName);
	        rs = pstmt.executeQuery();
	        Integer courierId = null;
	        if (rs.next()) {
	            courierId = rs.getInt("Id");
	        }
	        rs.close();
	        pstmt.close();

	        if (courierId == null) {
	            return -1;
	        }

	        // If pricePercentage is null, generate a random percentage within +/-10%
	        if (pricePercentage == null) {
	            double randomPercentage = 0.9 + (1.1 - 0.9) * new Random().nextDouble();
	            pricePercentage = BigDecimal.valueOf(randomPercentage).setScale(3, RoundingMode.HALF_UP);
	        }else {
	        	if (pricePercentage.compareTo(new BigDecimal(10)) > 0 || pricePercentage.compareTo(new BigDecimal(-10)) < 0) {
	        		return -1;
	        	}
	        	else {
	        		pricePercentage = (new BigDecimal(1)).add(pricePercentage.divide(new BigDecimal(100)));
	        	}
	        }

	        String insertOfferSql = "INSERT INTO [Offer] (PackageId, CourierId, Percentage) VALUES (?, ?, ?)";
	        pstmt = conn.prepareStatement(insertOfferSql, Statement.RETURN_GENERATED_KEYS);
	        pstmt.setInt(1, packageId);
	        pstmt.setInt(2, courierId);
	        pstmt.setBigDecimal(3, pricePercentage);
	        int affectedRows = pstmt.executeUpdate();

	        if (affectedRows == 0) {
	            return -1;
	        }

	        
	        rs = pstmt.getGeneratedKeys();
	        if (rs.next()) {
	            generatedId = rs.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return -1;
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return generatedId;
	}

}
