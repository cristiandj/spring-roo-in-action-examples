// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.rooinaction.coursemanager.jsf.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import org.rooinaction.coursemanager.jsf.converter.InvoiceConverter;
import org.rooinaction.coursemanager.model.Invoice;

privileged aspect InvoiceConverter_Roo_Converter {
    
    declare parents: InvoiceConverter implements Converter;
    
    declare @type: InvoiceConverter: @FacesConverter("org.rooinaction.coursemanager.jsf.converter.InvoiceConverter");
    
    public Object InvoiceConverter.getAsObject(FacesContext context, UIComponent component, String value) {
        if (value == null || value.length() == 0) {
            return null;
        }
        Long id = Long.parseLong(value);
        return Invoice.findInvoice(id);
    }
    
    public String InvoiceConverter.getAsString(FacesContext context, UIComponent component, Object value) {
        return value instanceof Invoice ? ((Invoice) value).getId().toString() : "";
    }
    
}
