package com.ilussencio;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {

    public void getConection(){
        String urlConnection = "jdbc:mysql://localhost/dio";
        
        try (Connection conn = DriverManager.getConnection(urlConnection , "root","")){
            System.out.println("Sucesso! Connectado com sucesso!");
        } catch(Exception e) {
            System.out.println("Falha!");
        }

        return conn;
    }

}
