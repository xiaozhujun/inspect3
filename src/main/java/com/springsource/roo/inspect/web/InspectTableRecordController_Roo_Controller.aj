// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.roo.inspect.web;

import com.springsource.roo.inspect.domain.InspectTable;
import com.springsource.roo.inspect.domain.InspectTableRecord;
import com.springsource.roo.inspect.domain.Users;
import com.springsource.roo.inspect.web.InspectTableRecordController;
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

privileged aspect InspectTableRecordController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String InspectTableRecordController.create(@Valid InspectTableRecord inspectTableRecord, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, inspectTableRecord);
            return "inspecttablerecords/create";
        }
        uiModel.asMap().clear();
        inspectTableRecord.persist();
        return "redirect:/inspecttablerecords/" + encodeUrlPathSegment(inspectTableRecord.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String InspectTableRecordController.createForm(Model uiModel) {
        populateEditForm(uiModel, new InspectTableRecord());
        return "inspecttablerecords/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String InspectTableRecordController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("inspecttablerecord", InspectTableRecord.findInspectTableRecord(id));
        uiModel.addAttribute("itemId", id);
        return "inspecttablerecords/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String InspectTableRecordController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("inspecttablerecords", InspectTableRecord.findInspectTableRecordEntries(firstResult, sizeNo));
            float nrOfPages = (float) InspectTableRecord.countInspectTableRecords() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("inspecttablerecords", InspectTableRecord.findAllInspectTableRecords());
        }
        addDateTimeFormatPatterns(uiModel);
        return "inspecttablerecords/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String InspectTableRecordController.update(@Valid InspectTableRecord inspectTableRecord, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, inspectTableRecord);
            return "inspecttablerecords/update";
        }
        uiModel.asMap().clear();
        inspectTableRecord.merge();
        return "redirect:/inspecttablerecords/" + encodeUrlPathSegment(inspectTableRecord.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String InspectTableRecordController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, InspectTableRecord.findInspectTableRecord(id));
        return "inspecttablerecords/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String InspectTableRecordController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        InspectTableRecord inspectTableRecord = InspectTableRecord.findInspectTableRecord(id);
        inspectTableRecord.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/inspecttablerecords";
    }
    
    void InspectTableRecordController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("inspectTableRecord_createtime_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void InspectTableRecordController.populateEditForm(Model uiModel, InspectTableRecord inspectTableRecord) {
        uiModel.addAttribute("inspectTableRecord", inspectTableRecord);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("inspecttables", InspectTable.findAllInspectTables());
        uiModel.addAttribute("userses", Users.findAllUserses());
    }
    
    String InspectTableRecordController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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