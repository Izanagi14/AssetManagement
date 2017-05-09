/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejb;

import java.io.InputStream;
import java.io.PrintStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.ejb.Stateless;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 *
 * @author apurv
 */
@MultipartConfig(maxFileSize = 16177215)

@Stateless
public class AddAttachments implements AddAttachmentsLocal {

    @Override
    public String addAttachment(String id, String eid,Part file) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            InputStream inputStream = null;
            inputStream = file.getInputStream();

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Asset_Management", "root", "");
            Statement statement = conn.createStatement();
            statement = conn.createStatement();
            
            String sql = "INSERT INTO Attachment (AssetID, File, Eid) values ('"+id+"','"+inputStream+"','" + eid +"')";
            //System.out.println(inputStream);
            System.out.println(sql);
            if (statement.executeUpdate(sql) > 0) {
                System.out.println("akfkjlaehfjhajfhajehfkahefkhakjfhkj");
                conn.close();
                statement.close();

                return "true";
            } else {
                conn.close();
                statement.close();

                return "false";
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "false";
    }

}
