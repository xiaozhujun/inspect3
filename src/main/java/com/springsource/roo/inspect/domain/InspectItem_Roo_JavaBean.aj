// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.roo.inspect.domain;

import com.springsource.roo.inspect.domain.InspectItem;
import com.springsource.roo.inspect.domain.InspectTable;
import com.springsource.roo.inspect.domain.InspectTag;
import com.springsource.roo.inspect.domain.TValue;
import java.util.Date;
import java.util.Set;

privileged aspect InspectItem_Roo_JavaBean {
    
    public String InspectItem.getName() {
        return this.name;
    }
    
    public void InspectItem.setName(String name) {
        this.name = name;
    }
    
    public String InspectItem.getDescription() {
        return this.description;
    }
    
    public void InspectItem.setDescription(String description) {
        this.description = description;
    }
    
    public Date InspectItem.getCreatetime() {
        return this.createtime;
    }
    
    public void InspectItem.setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
    
    public String InspectItem.getNumbers() {
        return this.numbers;
    }
    
    public void InspectItem.setNumbers(String numbers) {
        this.numbers = numbers;
    }
    
    public String InspectItem.getIsInput() {
        return this.IsInput;
    }
    
    public void InspectItem.setIsInput(String IsInput) {
        this.IsInput = IsInput;
    }
    
    public String InspectItem.getUnit() {
        return this.unit;
    }
    
    public void InspectItem.setUnit(String unit) {
        this.unit = unit;
    }
    
    public InspectTable InspectItem.getInspecttable() {
        return this.inspecttable;
    }
    
    public void InspectItem.setInspecttable(InspectTable inspecttable) {
        this.inspecttable = inspecttable;
    }
    
    public InspectTag InspectItem.getTag() {
        return this.tag;
    }
    
    public void InspectItem.setTag(InspectTag tag) {
        this.tag = tag;
    }
    
    public Set<TValue> InspectItem.getTvalues() {
        return this.tvalues;
    }
    
    public void InspectItem.setTvalues(Set<TValue> tvalues) {
        this.tvalues = tvalues;
    }
    
}