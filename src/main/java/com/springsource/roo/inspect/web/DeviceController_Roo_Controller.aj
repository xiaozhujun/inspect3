// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.roo.inspect.web;

import com.springsource.roo.inspect.domain.Device;
import com.springsource.roo.inspect.domain.Users;
import com.springsource.roo.inspect.web.DeviceController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect DeviceController_Roo_Controller {
    
    @RequestMapping(value="/{role}",method = RequestMethod.POST, produces = "text/html")
    public String DeviceController.create(@Valid Device device, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest,@PathVariable("role") int role) {
       
    	if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, device);
            if(role==1){
            return "devices/create";
            }else if(role==0){
            return "devices/usercreate";	
            }
           
        }
        uiModel.asMap().clear();
        device.persist();
        if(role==1){
        return "redirect:/devices/" + encodeUrlPathSegment(device.getId().toString(), httpServletRequest)+"/1";
        }else if(role==0){
        	return "redirect:/devices/" + encodeUrlPathSegment(device.getId().toString(), httpServletRequest)+"/0";	
        }
          return "";
        }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String DeviceController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Device());
        return "devices/create";
    }
    @RequestMapping(params = "userform", produces = "text/html")
    public String DeviceController.createUForm(Model uiModel) {
        populateEditForm(uiModel, new Device());
        return "devices/usercreate";
    }
     @RequestMapping(params = "upload", produces = "text/html")
    public String DeviceController.uploadData(Model uiModel) {
      
        return "devices/upload";
    }
     @RequestMapping(params = "userupload", produces = "text/html")
    public String DeviceController.useruploadData(Model uiModel) {
      
        return "devices/userupload";
    }
       @RequestMapping(params = "gosearch", produces = "text/html")
    public String DeviceController.gosearch(Model uiModel) {
      
        return "devices/gosearch";
    }
      @RequestMapping(params = "gousersearch", produces = "text/html")
    public String DeviceController.gousersearch(Model uiModel) {
      
        return "devices/gousersearch";
    }
    @RequestMapping(value = "/{id}/{role}", produces = "text/html")
    public String DeviceController.show(@PathVariable("id") Long id,@PathVariable("role") int role, Model uiModel) {
        uiModel.addAttribute("device", Device.findDevice(id));
        uiModel.addAttribute("itemId", id);
        if(role==1){
        return "devices/show";
        }else if(role==0){
        	return "devices/usershow";
        }
        return "";
    }
    
    @RequestMapping(produces = "text/html")
    public String DeviceController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size,@RequestParam(value = "role", required = false) Integer role, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("devices", Device.findDeviceEntries(firstResult, sizeNo));
            float nrOfPages = (float) Device.countDevices() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("devices", Device.findAllDevices());
        }
        if(role==1){
        	uiModel.addAttribute("role", 1);
        return "devices/list";
        }else if(role==0){
        	uiModel.addAttribute("role", 0);
        return "devices/userlist";	
        }
        return "";
    }
    
    
    
    @RequestMapping(value="/{role}",method = RequestMethod.PUT, produces = "text/html")
    public String DeviceController.update(@Valid Device device, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest,@PathVariable("role") int role ) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, device);
            if(role==1){
            return "devices/update";
            }else if(role==0){
            return "devices/userupdate";
            }
          
        }
        uiModel.asMap().clear();
        device.merge();
        if(role==1){
        return "redirect:/devices/" + encodeUrlPathSegment(device.getId().toString(), httpServletRequest)+"/1";
        }else if(role==0){
        	return "redirect:/devices/" + encodeUrlPathSegment(device.getId().toString(), httpServletRequest)+"/0";
        }
        return "";
        }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String DeviceController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Device.findDevice(id));
        return "devices/update";
    }
    
    @RequestMapping(value = "/{id}", params = "userform", produces = "text/html")
    public String DeviceController.updateUForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Device.findDevice(id));
        return "devices/userupdate";
    }
    
    @RequestMapping(value = "/{id}/{role}", method = RequestMethod.DELETE, produces = "text/html")
    public String DeviceController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size,@PathVariable("role") int role, Model uiModel) {
        Device device = Device.findDevice(id);
        device.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        if(role==1){
            uiModel.addAttribute("role",1);
            return "redirect:/devices";
            }else if(role==0){
            	uiModel.addAttribute("role",0);
            	return "redirect:/devices";
            }
                return "";
        
    }
    
    void DeviceController.populateEditForm(Model uiModel, Device device) {
        uiModel.addAttribute("device", device);
    }
    
    String DeviceController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
