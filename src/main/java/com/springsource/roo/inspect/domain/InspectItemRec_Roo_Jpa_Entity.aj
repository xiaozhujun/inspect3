// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.roo.inspect.domain;

import com.springsource.roo.inspect.domain.InspectItemRec;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect InspectItemRec_Roo_Jpa_Entity {
    
    declare @type: InspectItemRec: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long InspectItemRec.id;
    
    @Version
    @Column(name = "version")
    private Integer InspectItemRec.version;
    
    public Long InspectItemRec.getId() {
        return this.id;
    }
    
    public void InspectItemRec.setId(Long id) {
        this.id = id;
    }
    
    public Integer InspectItemRec.getVersion() {
        return this.version;
    }
    
    public void InspectItemRec.setVersion(Integer version) {
        this.version = version;
    }
    
}
