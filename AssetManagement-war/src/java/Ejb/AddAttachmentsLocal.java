/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejb;

import java.sql.Blob;
import javax.ejb.Local;
import javax.servlet.http.Part;

/**
 *
 * @author apurv
 */
@Local
public interface AddAttachmentsLocal {

    String addAttachment(String id, String eid, Part file);
    
}
