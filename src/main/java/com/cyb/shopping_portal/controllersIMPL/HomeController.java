package com.cyb.shopping_portal.controllersIMPL;

import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cyb.shopping_portal.entities.Orders;
import com.cyb.shopping_portal.entities.Products;
import com.cyb.shopping_portal.entities.Users;
import com.cyb.shopping_portal.services.UserService;
import com.mchange.v2.c3p0.impl.NewProxyDatabaseMetaData;

@Controller
public class HomeController {

	@Autowired
	private UserService userService;

	private Logger LOGGER = Logger.getLogger(HomeController.class);

	@RequestMapping(value = "/")

	public ModelAndView homePage(HttpSession session, ModelMap modelMap,
			@RequestParam(value = "user", required = false) String msg) {

		List<Products> prodlist = userService.getAllProductsList();
		for (Products prod : prodlist) {
			prod.setBase64image(new String(Base64.getEncoder().encode(prod.getImage())));

		}
		modelMap.put("products", prodlist);

		if (session.getAttribute("USER") != null && session.getAttribute("ROLE").equals("USER")) {
			modelMap.put("username",session.getAttribute("USER") );
			return new ModelAndView("pages/index", modelMap);

		} else {
			
		
			modelMap.put("user", msg);
			modelMap.put("username", "nouser");
			return new ModelAndView("pages/index", modelMap);
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginPage(ModelMap modelMap, HttpServletRequest httpServletRequest, HttpSession session) {

		List<Products> prodlist = userService.getAllProductsList();
		for (Products prod : prodlist) {
			prod.setBase64image(new String(Base64.getEncoder().encode(prod.getImage())));

		}
		modelMap.put("products", prodlist);

		String uname = httpServletRequest.getParameter("uname");
		String pass = httpServletRequest.getParameter("psw");

		Users usr = userService.validateUser(uname, pass);
		if (usr != null && usr.getRole().equalsIgnoreCase("USER")) {

			session.setAttribute("USER", usr.getName());
			session.setAttribute("ROLE", usr.getRole());
			session.setAttribute("userid", usr.getUserId());

			modelMap.put("username", usr.getName());
			return new ModelAndView("pages/index", modelMap);

		} else {
			modelMap.put("username", "nouser");
			modelMap.put("credentail", "invalid credentails");
			return new ModelAndView("pages/index", modelMap);
		}

	}

	@RequestMapping(value = "/bookProduct/{id}")
	public ModelAndView confirmationPage(ModelMap modelMap, @PathVariable String id,HttpSession session) {
	
		
		
		

		if (session.getAttribute("USER") != null && session.getAttribute("ROLE").equals("USER")) {

			Products prod = userService.getProductDetails(Integer.parseInt(id));

			prod.setBase64image(new String(Base64.getEncoder().encode(prod.getImage())));

			modelMap.put("product", prod);
			modelMap.put("username", session.getAttribute("USER"));
			return new ModelAndView("pages/confirmation", modelMap);

		} else {
			List<Products> prodlist = userService.getAllProductsList();
			for (Products prod : prodlist) {
				prod.setBase64image(new String(Base64.getEncoder().encode(prod.getImage())));

			}
			modelMap.put("products", prodlist);

			modelMap.put("username", "nouser");
			return new ModelAndView("pages/index", modelMap);
		}
		
		
		
		
		
		
		
	}

	@RequestMapping(value = "bookProduct/booking/{id}/{qty}")
	public ModelAndView bookingPage(ModelMap modelMap, @PathVariable String id, @PathVariable String qty,
			HttpSession session) {

		
		
		if (session.getAttribute("USER") != null && session.getAttribute("ROLE").equals("USER")) {
		
		int idd = 0;
		int qnty = 0;
		try {

			idd = Integer.parseInt(id);
			qnty = Integer.parseInt(qty);
		} catch (NumberFormatException e) {

		}

		Products prod = userService.getProductDetails(Integer.parseInt(id));

		Orders ord = new Orders();
		ord.setProdId(idd);
		ord.setOrder_date(new Date());
		ord.setQuantity(qnty);
		ord.setUserId((String) session.getAttribute("userid"));

		userService.orderproduct(ord);
		userService.UpdateProduct(idd, prod.getQuantity() - qnty);

		prod.setBase64image(new String(Base64.getEncoder().encode(prod.getImage())));
		modelMap.put("product", prod);
		modelMap.put("username", "Saurabh");
		return new ModelAndView("pages/thankyou", modelMap);
	}
		else{
			List<Products> prodlist = userService.getAllProductsList();
			for (Products prod : prodlist) {
				prod.setBase64image(new String(Base64.getEncoder().encode(prod.getImage())));

			}
			modelMap.put("products", prodlist);

			
			modelMap.put("username", "nouser");
			return new ModelAndView("pages/index", modelMap);
		}
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView registerUser(ModelMap modelMap, ServletRequest request,HttpSession session) {

		Users u = new Users();
		String prfx = request.getParameter("prefix");
		String name = request.getParameter("name");
		String uid = request.getParameter("uid");
		String pwd = request.getParameter("pwd");
		String adrs = request.getParameter("address");
		String mob = request.getParameter("mobno");
		u.setAddress(adrs);
		u.setPassword(pwd);
		u.setUserId(uid);
		u.setRole("USER");
		u.setMobno(mob);
		u.setName(prfx + " " + name);

		int res = userService.checkUser(u);
		if (res == 1) {

			userService.registerUser(u);

			List<Products> prodlist = userService.getAllProductsList();
			for (Products prod : prodlist) {
				prod.setBase64image(new String(Base64.getEncoder().encode(prod.getImage())));

			}
			modelMap.put("products", prodlist);
			modelMap.put("username", u.getName());
			session.setAttribute("USER", u.getName());
			session.setAttribute("userid", u.getUserId());

			return new ModelAndView("pages/index", modelMap);

		} else {
			modelMap.addAttribute("user", "User already exist ");
			return new ModelAndView("redirect:/", modelMap);
		}
	}

	
	
	
	
	
	@RequestMapping(value = {"/logout_user","/bookProduct/**/logout_user","/bookProduct/logout_user"})
	public ModelAndView logout(HttpSession session)
	{
			
	session.removeAttribute("USER");
	if (session != null) {
	    session.invalidate();
	}
	
	return new ModelAndView("redirect:/");
	}
	
	
	
	

	@RequestMapping(value = "/profile",method=RequestMethod.GET)
	public ModelAndView getProfile(HttpSession session,ModelAndView modal,HttpServletRequest request,ModelMap modelMap )
	{
		if (session.getAttribute("USER") != null && session.getAttribute("ROLE").equals("USER")) {
		modal.addObject("profile","");
		String uid=(String)session.getAttribute("userid");
		Users user=userService.getUsers(uid);
		modal.addObject("users",user);
		modal.setViewName("pages/profile");
		return modal;
		
		}
		else{
			List<Products> prodlist = userService.getAllProductsList();
			for (Products prod : prodlist) {
				prod.setBase64image(new String(Base64.getEncoder().encode(prod.getImage())));

			}
			modelMap.put("products", prodlist);

			modelMap.put("username", "nouser");
			return new ModelAndView("pages/index", modelMap);
			
		}
	}
	
	
	
	
	
	@RequestMapping(value = "/profile", method=RequestMethod.POST)
	public ModelAndView updateProfile(HttpSession session,ModelAndView modal,HttpServletRequest request,ModelMap modelMap )
	{
	
		if (session.getAttribute("USER") != null && session.getAttribute("ROLE").equals("USER")) {
			String uid= request.getParameter("uid");
			String name= request.getParameter("name");
			String address= request.getParameter("address");
			String mobno= request.getParameter("mobno");
			
			 int res=userService.updateUser(uid,name,address,mobno);
			 if(res == 1)
				 modal.addObject("profile","Profile Updated SuccessFully!!!!!!!!!");
		
				String uidd=(String)session.getAttribute("userid");
				Users user=userService.getUsers(uidd);
				modal.addObject("users",user);
				modal.setViewName("pages/profile");
				return modal;
		}
		else{
			List<Products> prodlist = userService.getAllProductsList();
			for (Products prod : prodlist) {
				prod.setBase64image(new String(Base64.getEncoder().encode(prod.getImage())));

			}
			modelMap.put("products", prodlist);

			modelMap.put("username", "nouser");
			return new ModelAndView("pages/index", modelMap);
			
		}

	}
	

	@RequestMapping(value = "/history")
	public ModelAndView getHistory(HttpSession session,ModelMap modelMap )
	{
		
	String uid=(String)session.getAttribute("userid");
	if(uid != null){
	List<Products> prodlist = userService.getHistory(uid);
	if(prodlist == null)
	{
		modelMap.put("username", session.getAttribute("USER"));
		modelMap.put("nohstry", "You Have Not Purchased Yet... Be The Customer Of The This Shop By Purchasing One!!");
		return new ModelAndView("pages/order_history",modelMap);
		
	}
	for (Products prod : prodlist) {
		prod.setBase64image(new String(Base64.getEncoder().encode(prod.getImage())));

	}
	
		modelMap.put("products", prodlist);
		modelMap.put("username", session.getAttribute("USER"));
		return new ModelAndView("pages/order_history",modelMap);
	}
	
	else 
	{
		
		modelMap.put("username", "nouser");
		return new ModelAndView("redirect:/", modelMap);
	}
	}
}
