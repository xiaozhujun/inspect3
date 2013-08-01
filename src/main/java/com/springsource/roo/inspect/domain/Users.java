package com.springsource.roo.inspect.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import javax.validation.constraints.Size;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
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
    @Size(min = 6)
    private String userpwd;

    /**
     */
    private String usersex;

    /**
     */
    private String useraddress;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date birth;

    /**
     */
    private Integer userage;

    /**
     */
    @ManyToOne
    private Dept dept;

    /**
     */
    @ManyToOne
    private Roles urole;
}
