/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author apurv
 */
@Stateless
public class MessageEntityFacade extends AbstractFacade<MessageEntity1> {

    @PersistenceContext(unitName = "AssetManagement-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MessageEntityFacade() {
        super(MessageEntity1.class);
    }
    
}
