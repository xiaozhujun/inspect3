// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.roo.inspect.domain;

import com.springsource.roo.inspect.domain.Dept;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Dept_Roo_Jpa_Entity {
    
    declare @type: Dept: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Dept.id;
    
    @Version
    @Column(name = "version")
    private Integer Dept.version;
    
    public Long Dept.getId() {
        return this.id;
    }
    
    public void Dept.setId(Long id) {
        this.id = id;
    }
    
    public Integer Dept.getVersion() {
        return this.version;
    }
    
    public void Dept.setVersion(Integer version) {
        this.version = version;
    }
    
}
