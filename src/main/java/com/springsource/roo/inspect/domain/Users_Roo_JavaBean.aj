// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.roo.inspect.domain;

import com.springsource.roo.inspect.domain.Dept;
import com.springsource.roo.inspect.domain.Roles;
import com.springsource.roo.inspect.domain.Users;
import java.util.Date;

privileged aspect Users_Roo_JavaBean {
    
    public String Users.getUsername() {
        return this.username;
    }
    
    public void Users.setUsername(String username) {
        this.username = username;
    }
    
    public String Users.getUserpwd() {
        return this.userpwd;
    }
    
    public void Users.setUserpwd(String userpwd) {
        this.userpwd = userpwd;
    }
    
    public String Users.getUsersex() {
        return this.usersex;
    }
    
    public void Users.setUsersex(String usersex) {
        this.usersex = usersex;
    }
    
    public String Users.getUseraddress() {
        return this.useraddress;
    }
    
    public void Users.setUseraddress(String useraddress) {
        this.useraddress = useraddress;
    }
    
    public Date Users.getBirth() {
        return this.birth;
    }
    
    public void Users.setBirth(Date birth) {
        this.birth = birth;
    }
    
    public Integer Users.getUserage() {
        return this.userage;
    }
    
    public void Users.setUserage(Integer userage) {
        this.userage = userage;
    }
    
    public Dept Users.getDept() {
        return this.dept;
    }
    
    public void Users.setDept(Dept dept) {
        this.dept = dept;
    }
    
    public Roles Users.getUrole() {
        return this.urole;
    }
    
    public void Users.setUrole(Roles urole) {
        this.urole = urole;
    }
    
}
