// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.roo.inspect.domain;

import com.springsource.roo.inspect.domain.DeviceInspectRec;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect DeviceInspectRec_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager DeviceInspectRec.entityManager;
    
    public static final EntityManager DeviceInspectRec.entityManager() {
        EntityManager em = new DeviceInspectRec().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long DeviceInspectRec.countDeviceInspectRecs() {
        return entityManager().createQuery("SELECT COUNT(o) FROM DeviceInspectRec o", Long.class).getSingleResult();
    }
    
    public static List<DeviceInspectRec> DeviceInspectRec.findAllDeviceInspectRecs() {
        return entityManager().createQuery("SELECT o FROM DeviceInspectRec o", DeviceInspectRec.class).getResultList();
    }
    
    public static DeviceInspectRec DeviceInspectRec.findDeviceInspectRec(Long id) {
        if (id == null) return null;
        return entityManager().find(DeviceInspectRec.class, id);
    }
    
    public static List<DeviceInspectRec> DeviceInspectRec.findDeviceInspectRecEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM DeviceInspectRec o", DeviceInspectRec.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void DeviceInspectRec.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void DeviceInspectRec.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            DeviceInspectRec attached = DeviceInspectRec.findDeviceInspectRec(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void DeviceInspectRec.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void DeviceInspectRec.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public DeviceInspectRec DeviceInspectRec.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        DeviceInspectRec merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
