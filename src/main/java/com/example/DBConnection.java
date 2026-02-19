package com.example;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/userapp",
                "root",
                "root"   // change if your password is different
            );

            return con;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
