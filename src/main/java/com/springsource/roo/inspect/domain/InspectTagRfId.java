package com.springsource.roo.inspect.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class InspectTagRfId {

    /**
     */
    @Column(unique = true)
    private String tagname;

    /**
     */
    private String description;

    /**
     */
    private String numbers;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date createtime;

    /**
     */
    @ManyToOne
    private InspectTag tagcag;

    /**
     */
    @ManyToOne
    private Device device;
}
