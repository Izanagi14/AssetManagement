/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejb;

import javax.ejb.Local;

/**
 *
 * @author apurv
 */
@Local
public interface AddingNotesLocal {

   

    public boolean businessMethod(String id, String note, String eid);
    
}
