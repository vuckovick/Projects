package student;
import rs.etf.sab.operations.*;
import rs.etf.sab.tests.*;


public class StudentMain {

    public static void main(String[] args) {
        CityOperations cityOperations = new vk210524_cityOperations(); // Change this to your implementation.
        DistrictOperations districtOperations = new vk210524_districtOperations(); // Do it for all classes.
        CourierOperations courierOperations = new vk210524_courierOperations(); // e.g. = new MyDistrictOperations();
        CourierRequestOperation courierRequestOperation = new vk210524_courierRequestOperation();
        GeneralOperations generalOperations = new vk210524_generalOperations();
        UserOperations userOperations = new vk210524_userOperations();
        VehicleOperations vehicleOperations = new vk210524_vehicleOperations();
        PackageOperations packageOperations = new vk210524_packageOperations();
        
        TestHandler.createInstance(
                cityOperations,
                courierOperations,
                courierRequestOperation,
                districtOperations,
                generalOperations,
                userOperations,
                vehicleOperations,
                packageOperations);

        TestRunner.runTests();
    }
}
