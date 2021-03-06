// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.roo.inspect.web;

import com.springsource.roo.inspect.domain.InspectItem;
import com.springsource.roo.inspect.domain.InspectItemRec;
import com.springsource.roo.inspect.domain.InspectTable;
import com.springsource.roo.inspect.domain.InspectTableRecord;
import com.springsource.roo.inspect.domain.InspectTag;
import com.springsource.roo.inspect.domain.Users;
import com.springsource.roo.inspect.web.InspectItemRecController;
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

privileged aspect InspectItemRecController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String InspectItemRecController.create(@Valid InspectItemRec inspectItemRec, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, inspectItemRec);
            return "inspectitemrecs/create";
        }
        uiModel.asMap().clear();
        inspectItemRec.persist();
        return "redirect:/inspectitemrecs/" + encodeUrlPathSegment(inspectItemRec.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String InspectItemRecController.createForm(Model uiModel) {
        populateEditForm(uiModel, new InspectItemRec());
        return "inspectitemrecs/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String InspectItemRecController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("inspectitemrec", InspectItemRec.findInspectItemRec(id));
        uiModel.addAttribute("itemId", id);
        return "inspectitemrecs/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String InspectItemRecController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("inspectitemrecs", InspectItemRec.findInspectItemRecEntries(firstResult, sizeNo));
            float nrOfPages = (float) InspectItemRec.countInspectItemRecs() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("inspectitemrecs", InspectItemRec.findAllInspectItemRecs());
        }
        addDateTimeFormatPatterns(uiModel);
        return "inspectitemrecs/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String InspectItemRecController.update(@Valid InspectItemRec inspectItemRec, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, inspectItemRec);
            return "inspectitemrecs/update";
        }
        uiModel.asMap().clear();
        inspectItemRec.merge();
        return "redirect:/inspectitemrecs/" + encodeUrlPathSegment(inspectItemRec.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String InspectItemRecController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, InspectItemRec.findInspectItemRec(id));
        return "inspectitemrecs/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String InspectItemRecController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        InspectItemRec inspectItemRec = InspectItemRec.findInspectItemRec(id);
        inspectItemRec.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/inspectitemrecs";
    }
    
    void InspectItemRecController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("inspectItemRec_createtime_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void InspectItemRecController.populateEditForm(Model uiModel, InspectItemRec inspectItemRec) {
        uiModel.addAttribute("inspectItemRec", inspectItemRec);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("inspectitems", InspectItem.findAllInspectItems());
        uiModel.addAttribute("inspecttables", InspectTable.findAllInspectTables());
        uiModel.addAttribute("inspecttablerecords", InspectTableRecord.findAllInspectTableRecords());
        uiModel.addAttribute("inspecttags", InspectTag.findAllInspectTags());
        uiModel.addAttribute("userses", Users.findAllUserses());
    }
    
    String InspectItemRecController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
