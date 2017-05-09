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
public interface AssetAddLocal {
    
     public String assetAdd(String name, String id, String date, String Quality, String Employee_Id, String Minutes_To, String Minutes_From);
    
}
