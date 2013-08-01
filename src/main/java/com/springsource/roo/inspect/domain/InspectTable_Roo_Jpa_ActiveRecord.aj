// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.roo.inspect.domain;

import com.springsource.roo.inspect.domain.InspectTable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect InspectTable_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager InspectTable.entityManager;
    
    public static final EntityManager InspectTable.entityManager() {
        EntityManager em = new InspectTable().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long InspectTable.countInspectTables() {
        return entityManager().createQuery("SELECT COUNT(o) FROM InspectTable o", Long.class).getSingleResult();
    }
    
    public static List<InspectTable> InspectTable.findAllInspectTables() {
        return entityManager().createQuery("SELECT o FROM InspectTable o", InspectTable.class).getResultList();
    }
    
    public static InspectTable InspectTable.findInspectTable(Long id) {
        if (id == null) return null;
        return entityManager().find(InspectTable.class, id);
    }
    
    public static List<InspectTable> InspectTable.findInspectTableEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM InspectTable o", InspectTable.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void InspectTable.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void InspectTable.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            InspectTable attached = InspectTable.findInspectTable(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void InspectTable.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void InspectTable.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public InspectTable InspectTable.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        InspectTable merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
