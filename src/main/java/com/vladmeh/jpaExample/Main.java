package com.vladmeh.jpaExample;

import com.vladmeh.jpaExample.Entity.Address;
import com.vladmeh.jpaExample.Factory.PersistenceManager;

import javax.persistence.EntityManager;

/**
 * @autor mvl on 18.12.2017.
 */
public class Main {
    public static void main(String[] args) {
        Address address = new Address();

        address.setCity("Dhaka")
                .setCountry("Bangladesh")
                .setPostcode("1000")
                .setStreet("Poribagh");

        EntityManager em = PersistenceManager.INSTANCE.getEntityManager();
        em.getTransaction().begin();
        em.persist(address);
        em.getTransaction().commit();
        em.close();
        PersistenceManager.INSTANCE.close();
    }
}
