/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejb;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author apurv
 */
@Singleton
public class LoginBean2_1 implements LoginBean2Local {

    @PersistenceContext(unitName = "Cloud_Project_Final-ejbPU")
    private EntityManager em;

    public String LoginCheck(String email, String password) {
        return "passed";
    }

    @Override
    public String setName(String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void persist(Object object) {
        em.persist(object);
    }
}
