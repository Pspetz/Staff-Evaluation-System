/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javasqlproject;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;
import java.util.ArrayList;
import logins.login;

/**
 *
 * @author giorgospc
 */
public class Javasqlproject {
      public static Connection connection;
      
     public static void connect() throws SQLException {
        connection = DriverManager.getConnection("jdbc:mariadb://localhost:3306/company");//to fix timezone warning
    }

    
    public static void main(String[] args){
        login log=new login();
    }
}