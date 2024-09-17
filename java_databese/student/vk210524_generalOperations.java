package student;

import java.sql.*;

import rs.etf.sab.operations.GeneralOperations;

public class vk210524_generalOperations implements GeneralOperations {

    private Connection conn;

    public vk210524_generalOperations() {
        conn = DB.getInstance().getConnection();
    }

    @Override
    protected void finalize() throws Throwable {
        conn.close();
    }

    @Override
    public void eraseAll() {
		try (Statement stmt = conn.createStatement()) {

           stmt.executeUpdate("EXEC sp_MSForEachTable 'DISABLE TRIGGER ALL ON ?'");
           stmt.executeUpdate("EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'");
           stmt.executeUpdate("EXEC sp_MSForEachTable 'DELETE FROM ?'");
           stmt.executeUpdate("EXEC sp_MSForEachTable 'ALTER TABLE ? CHECK CONSTRAINT ALL'");
           stmt.executeUpdate("EXEC sp_MSForEachTable 'ENABLE TRIGGER ALL ON ?'");


        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
}
