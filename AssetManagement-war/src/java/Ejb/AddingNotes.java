package Ejb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.ejb.Stateless;

@Stateless
public class AddingNotes implements AddingNotesLocal {

    @Override
    public boolean businessMethod(String id, String note,String eid) {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Asset_Management", "root", "");
            Statement s = conn.createStatement();
            s = conn.createStatement();
            System.out.println("in Session beans");
            String str = "insert into Notes(AssetID,Text,Eid) values('" + id + "'" + ", " + "'" + note + "','" + eid + "');";
            System.out.println(str);
            
            if (s.executeUpdate(str)>0) {
                conn.close();
                s.close();

                return true;
            } else {
                conn.close();
                s.close();

                return false;
            }

        } catch (Exception e) {

        }
        return false;
    }
}
