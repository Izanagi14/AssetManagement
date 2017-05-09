/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;

/**
 *
 * @author apurv
 */
@Stateless
public class AssetAdd implements AssetAddLocal {

    @Override
    public String assetAdd(String name, String id, String date, String Quality, String Skill, String Minutes_To, String Minutes_From) {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Asset_Management", "root", "");
            Statement s = conn.createStatement();
            s = conn.createStatement();
            String sql_query = "SELECT * FROM Employees";
            ResultSet rs = s.executeQuery(sql_query);
            rs.next();
            while (rs.next()) {
                String skills = rs.getString("Skills");
                System.out.println(skills);
                StringBuilder sb = new StringBuilder();
                sb.append(skills);
                String[] str = sb.toString().split(",");
                for(int i = 0 ; i < str.length;i++)
                System.out.println(str[i]);
                for (int i = 0; i < str.length; i++) {
                    if (str[i].compareTo(Skill) == 0) {
                        System.out.println("here WE Are");
                        String free1 = rs.getString("Free");
                        System.out.println(free1);
                        free1 = free1.trim();
                        if (free1.equalsIgnoreCase("true")) {
                            System.out.println("ab yaha hain");
                            String Employee_ID = rs.getString("Eid");
                            String query1 = "update Employees set Free='false' where Eid='" + Employee_ID + "'";
                            System.out.println(query1);
                            s.executeUpdate(query1);
                            String sql_query1 = "insert into Asset values(\"" + id + "\" , \"" + name + "\" , " + date + " , \"" + Quality + "\" , \"" + Employee_ID + "\" , " + Minutes_To + "," + Minutes_From + ",'" + Skill + "')";
                            System.out.println(sql_query1);

                            if (s.executeUpdate(sql_query1) > 0) {
                                return "true";
                            } else {
                                return "false";
                            }
                        }
                    }
                }
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AssetAdd.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "false";
    }
}
