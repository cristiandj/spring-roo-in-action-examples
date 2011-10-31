// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.rooinaction.cmsapp.web;

import com.rooinaction.cmsapp.domain.CourseRegistration;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect CourseRegistrationController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String CourseRegistrationController.create(@Valid CourseRegistration courseRegistration, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("courseRegistration", courseRegistration);
            return "courseregistrations/create";
        }
        uiModel.asMap().clear();
        courseRegistration.persist();
        return "redirect:/courseregistrations/" + encodeUrlPathSegment(courseRegistration.getId_().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String CourseRegistrationController.createForm(Model uiModel) {
        uiModel.addAttribute("courseRegistration", new CourseRegistration());
        return "courseregistrations/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String CourseRegistrationController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("courseregistration", CourseRegistration.findCourseRegistration(id));
        uiModel.addAttribute("itemId", id);
        return "courseregistrations/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String CourseRegistrationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("courseregistrations", CourseRegistration.findCourseRegistrationEntries(firstResult, sizeNo));
            float nrOfPages = (float) CourseRegistration.countCourseRegistrations() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("courseregistrations", CourseRegistration.findAllCourseRegistrations());
        }
        return "courseregistrations/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CourseRegistrationController.update(@Valid CourseRegistration courseRegistration, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("courseRegistration", courseRegistration);
            return "courseregistrations/update";
        }
        uiModel.asMap().clear();
        courseRegistration.merge();
        return "redirect:/courseregistrations/" + encodeUrlPathSegment(courseRegistration.getId_().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String CourseRegistrationController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("courseRegistration", CourseRegistration.findCourseRegistration(id));
        return "courseregistrations/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String CourseRegistrationController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        CourseRegistration courseRegistration = CourseRegistration.findCourseRegistration(id);
        courseRegistration.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/courseregistrations";
    }
    
    @ModelAttribute("courseregistrations")
    public Collection<CourseRegistration> CourseRegistrationController.populateCourseRegistrations() {
        return CourseRegistration.findAllCourseRegistrations();
    }
    
    String CourseRegistrationController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}