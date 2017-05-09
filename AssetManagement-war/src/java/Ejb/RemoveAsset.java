/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.ejb.Stateless;

/**
 *
 * @author apurv
 */
@Stateless
public class RemoveAsset implements RemoveAssetLocal {

    @Override
    public String removeAsset(String id) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Asset_Management", "root", "");
            Statement s = conn.createStatement();
            s = conn.createStatement();
            String sql_query = "delete from Asset where AssetID=\"" + id + "\";";
            System.out.println(sql_query);
            if (s.executeUpdate(sql_query) > 0) {
                return "true";
            } else {
                return "false";
            }

        } catch (Exception e) {

        }
        return "false";
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
