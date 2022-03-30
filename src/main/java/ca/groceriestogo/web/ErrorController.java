package ca.groceriestogo.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorController {
	@RequestMapping(value = "errors", method = RequestMethod.GET)
    public ModelAndView renderErrorPage(HttpServletRequest httpRequest, Model model) {
        
        ModelAndView errorPage = new ModelAndView("errorPage");
        String errorCode = "";
        String errorMsg = "";
        int httpErrorCode = getErrorCode(httpRequest);

        switch (httpErrorCode) {
            case 400: {
                errorCode = "Http Error Code: 400. Bad Request";
                errorMsg = "The server was unable to process your request. Please try again later.";
                break;
            }
            case 401: {
                errorCode = "Http Error Code: 401. Unauthorized";
                errorMsg = "You do not have access to this resource.";
                break;
            }
            case 404: {
                errorCode = "Http Error Code: 404. Resource not found";
                errorMsg = "The resource you are looking for could not be found.";
                break;
            }
            case 500: {
                errorCode = "Http Error Code: 500. Internal Server Error";
                errorMsg = "The server is suffering from an unexpected error. Please try again later.";
                break;
            }
        }
        errorPage.addObject("errorCode", errorCode);
        errorPage.addObject("errorMsg", errorMsg);
        return errorPage;
    }
    
    private int getErrorCode(HttpServletRequest httpRequest) {
        return (Integer) httpRequest
          .getAttribute("javax.servlet.error.status_code");
    }
    
    @RequestMapping(value = "500Error", method = RequestMethod.GET)
    public void throwRuntimeException() {
        throw new NullPointerException("Throwing a null pointer exception");
    }
}
