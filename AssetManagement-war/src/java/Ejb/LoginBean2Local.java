/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejb;

import java.util.TreeMap;
import java.util.Vector;
import javax.ejb.Local;

/**
 *
 * @author apurv
 */
@Local
public interface LoginBean2Local {

    String getName();

    TreeMap<String,Vector<TreeMap<String,String> > >  checkLogin(String email, String password);
    
}
