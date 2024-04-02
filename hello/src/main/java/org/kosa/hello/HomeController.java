package org.kosa.hello;

import java.lang.annotation.Target;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add_form(Model model) {
		return "add_form";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(int a, int b, Model model) {
		
		System.out.println("a = " + a);
		System.out.println("b = " + b);
		
		model.addAttribute("result", a + b);
		
		return "add";
	}
	
	@RequestMapping(value = "/add2Form")
	public String addForm(Model model) {
		return "add_form2";
	}
	
	@RequestMapping(value = "/add2")
	public String add2(int a, int b, Model model) {
		
		System.out.println("a = " + a);
		System.out.println("b = " + b);
		
		model.addAttribute("result", a + b);
		
		return "add";
	}
	
	@RequestMapping(value = "/add3Form")
	public String addForm3(Model model) {
		return "add_form3";
	}
	
	@RequestMapping(value = "/add3")
	public String add3(AddVO addVO, Model model) {
		
		System.out.println("a = " + addVO.getA());
		System.out.println("b = " + addVO.getB());
		
		addVO.calc();
		
		model.addAttribute("result", addVO.getResult());
		model.addAttribute("addVO", addVO);
		
		return "add3";
	}
	
}









