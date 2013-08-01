// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.roo.inspect.web;

import com.springsource.roo.inspect.domain.InspectTable;
import com.springsource.roo.inspect.domain.Roles;
import com.springsource.roo.inspect.web.InspectTableController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import com.xmlparse.dom4j.insertToTableTestXml;
import com.springsource.roo.inspect.dao.InspectTableImpl;
import com.xmlparse.dom4j.insertToRolesTableXml;
privileged aspect InspectTableController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String InspectTableController.create(@Valid InspectTable inspectTable, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, inspectTable);
            return "inspecttables/create";
        }
        uiModel.asMap().clear();
        inspectTable.persist();
        return "redirect:/inspecttables/" + encodeUrlPathSegment(inspectTable.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String InspectTableController.createForm(Model uiModel) {
        populateEditForm(uiModel, new InspectTable());
        return "inspecttables/create";
    }
   
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String InspectTableController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("inspecttable", InspectTable.findInspectTable(id));
        uiModel.addAttribute("itemId", id);
        return "inspecttables/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String InspectTableController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("inspecttables", InspectTable.findInspectTableEntries(firstResult, sizeNo));
            float nrOfPages = (float) InspectTable.countInspectTables() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("inspecttables", InspectTable.findAllInspectTables());
        }
        addDateTimeFormatPatterns(uiModel);
        return "inspecttables/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String InspectTableController.update(@Valid InspectTable inspectTable, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, inspectTable);
            return "inspecttables/update";
        }
        uiModel.asMap().clear();
        inspectTable.merge();
        return "redirect:/inspecttables/" + encodeUrlPathSegment(inspectTable.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String InspectTableController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, InspectTable.findInspectTable(id));
        return "inspecttables/update";
    }
   
    
     @RequestMapping(value = "/{id}", params = "download", produces = "text/html")
    public String InspectTableController.downForm(@PathVariable("id") int id) {
        System.out.println("haha");
        System.out.println(id+"ID");
	//根据这个id求的tablename
        InspectTableImpl t=new InspectTableImpl();
		System.out.println(t.getNameById(id));
		String tname=t.getNameById(id);
	String pathname="E://Inspect3//xmlFiles//"+tname+".xml";
	new insertToTableTestXml().createXml(pathname,id);
	//根据这个id求rolename
	       String rname=t.getRoleNameByTid(id);
	       String pathname1="E://Inspect3//xmlFiles//RolesTable.xml";
               new insertToRolesTableXml().createXml(pathname1);
        return "inspecttables/downSuccess";
    }
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String InspectTableController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        InspectTable inspectTable = InspectTable.findInspectTable(id);
        inspectTable.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/inspecttables";
    }
    
    void InspectTableController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("inspectTable_createtime_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void InspectTableController.populateEditForm(Model uiModel, InspectTable inspectTable) {
        uiModel.addAttribute("inspectTable", inspectTable);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("roleses", Roles.findAllRoleses());
    }
    
    String InspectTableController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
