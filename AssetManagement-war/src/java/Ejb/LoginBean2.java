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
import java.util.TreeMap;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Singleton;
import javax.servlet.http.Cookie;

/*
 * @author apurv
 */
@Singleton

public class LoginBean2 implements LoginBean2Local {

    Vector<TreeMap<String, String>> vec = new Vector<TreeMap<String, String>>();
    TreeMap<String, String> tsr = new TreeMap<String, String>();
    TreeMap<String, Vector<TreeMap<String, String>>> ts = new TreeMap<String, Vector<TreeMap<String, String>>>();

    @Override
    public String getName() {
        return "apurv";
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    @Override
    public TreeMap<String, Vector<TreeMap<String, String>>> checkLogin(String email, String password) {
        int flag = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Asset_Management", "root", "");

            System.out.println(email + " " + password);
            Statement s = conn.createStatement();
            s = conn.createStatement();
            String str = "select Password,Designation,Name from Employees where Eid=\"" + email + "\"";
            ResultSet rs = s.executeQuery(str);

            while (rs.next()) {
                System.out.println(rs.getString("Name") + " " + rs.getString("Password") + rs.getString("Designation"));
                String name = rs.getString("Name");
                String pass = rs.getString("Password");
                String designation = rs.getString("Designation");
                if (password.compareTo(pass) == 0) {
                    
                    tsr.put("name", name);
                    vec.add(tsr);
                    ts.put(designation, vec);
                    return ts;
                }
                rs.next();

            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(LoginBean2.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ts;

    }

}
