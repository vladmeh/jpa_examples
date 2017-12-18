package com.vladmeh.jpaExample.Factory;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * @autor mvl on 18.12.2017.
 */
public enum PersistenceManager {
    INSTANCE;

    private EntityManagerFactory emFactory;
    private PersistenceManager() {
        // "jpa-example" was the value of the name attribute of the
        // persistence-unit element.
        emFactory = Persistence.createEntityManagerFactory("jpa-example");
    }
    public EntityManager getEntityManager() {
        return emFactory.createEntityManager();
    }
    public void close() {
        emFactory.close();
    }
}
