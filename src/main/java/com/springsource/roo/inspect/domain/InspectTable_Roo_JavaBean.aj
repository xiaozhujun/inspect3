// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.roo.inspect.domain;

import com.springsource.roo.inspect.domain.InspectTable;
import com.springsource.roo.inspect.domain.Roles;
import java.util.Date;

privileged aspect InspectTable_Roo_JavaBean {
    
    public String InspectTable.getTname() {
        return this.tname;
    }
    
    public void InspectTable.setTname(String tname) {
        this.tname = tname;
    }
    
    public Date InspectTable.getCreatetime() {
        return this.createtime;
    }
    
    public void InspectTable.setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
    
    public Roles InspectTable.getTrole() {
        return this.trole;
    }
    
    public void InspectTable.setTrole(Roles trole) {
        this.trole = trole;
    }
    
}
