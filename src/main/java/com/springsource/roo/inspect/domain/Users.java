package com.springsource.roo.inspect.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Users {

    /**
     */
    @Column(unique = true)
    private String username;

    /**
     */
    private String userpwd;

    /**
     */
    private String usersex;

    /**
     */
    private String useraddress;

    /**
     */
    private String hascard;

    /**
     */
    private Integer userage;

    /**
     */
    @ManyToOne
    private Roles urole;
}
