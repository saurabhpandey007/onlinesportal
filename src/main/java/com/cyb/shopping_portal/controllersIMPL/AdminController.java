package com.cyb.shopping_portal.controllersIMPL;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cyb.shopping_portal.entities.Products;
import com.cyb.shopping_portal.services.AdminService;
@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private ServletContext context;
	 private Logger LOGGER = Logger.getLogger(AdminController.class);
	
	@RequestMapping(value = "/admin",method=RequestMethod.GET)
	public String adminLoginPage(HttpSession session)
	{
		
		if(session.getAttribute("USER") !=null && ((String)session.getAttribute("ROLE")).equalsIgnoreCase("Admin"))
		{
			return "redirect:/adminHome";
		}
		else
		{
			return "adminPages/admin_login";
			
		}
	}
	
	@RequestMapping(value = "/admin")
	public ModelAndView adminHomePage(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,ModelMap modmap,HttpSession session)
	{
		String uname=httpServletRequest.getParameter("uname");
		String pass=httpServletRequest.getParameter("psw");
		
		LOGGER.info(pass);
		LOGGER.info(uname);
		LOGGER.error(pass);
		LOGGER.error(uname);
		String role=adminService.validateAdmin(uname, pass);
		if(role.equalsIgnoreCase("Admin"))
		{
			
			session.setAttribute("USER", uname);
			session.setAttribute("ROLE", role);
			return new ModelAndView( "redirect:/adminHome");
			
		}
		else{
			modmap.put("errormsg", "Invalid Credentails Please Try Again");
			return new ModelAndView( "adminPages/admin_login","model",modmap);
		}
	}
	@RequestMapping(value = "/adminHome")
	public ModelAndView adminWelcomePage(ModelMap modmap,HttpSession session) throws UnsupportedEncodingException
	{
		if(session==null)
			return new ModelAndView( "redirect:/admin");

		List<Products> plist=adminService.getProductsList();
		for(Products prod:plist)
		{
			
			prod.setBase64image(new String(Base64.getEncoder().encode(prod.getImage())));
            
   		}
		modmap.put("products",plist );
		return new ModelAndView( "adminPages/admin_home",modmap);
	}
	
	@RequestMapping(value = "/deleteProduct/{id}")
	public ModelAndView deleteProduct(@PathVariable String id)
	{
		
		adminService.deleteProducts(Integer.parseInt(id));
	
	
	  return new ModelAndView ( "redirect:/adminHome");
	}
	
	@RequestMapping(value = "/editProduct/{id}",method=RequestMethod.GET)
	public ModelAndView editProduct(ModelAndView model,@PathVariable String id,HttpSession session)
	{
		
		int idd=Integer.parseInt(id);
		Products product = adminService.getProductsById(idd);
		session.setAttribute("product", product);
	    product.setBase64image(new String(Base64.getEncoder().encode(product.getImage()))); 
        model.addObject("products", product);
        model.setViewName("adminPages/editProduct");
       
        return model;
	}
	
	
	
	@RequestMapping(value = "/editProduct/{id}",method=RequestMethod.POST)
	public ModelAndView editProduct(@ModelAttribute Products products,
			@RequestParam("file") MultipartFile file ,HttpServletRequest request,HttpSession session)
	{
		
		
		if(!file.isEmpty())
		{
			try {
				products.setImage(file.getBytes());
				products.setImg_name(file.getOriginalFilename());
			} catch (IOException e) {
				System.out.println("io exception exploree it");
				e.printStackTrace();
			}
			
		}
		else
		{
			Products product=(Products) session.getAttribute("product");
			products.setImage(product.getImage());
			products.setImg_name(product.getImg_name());
			
		}
		
		adminService.updateProductDetail(products);
		
		return new ModelAndView ( "redirect:/adminHome");
	}
	
	
	
	@RequestMapping(value = "/addProduct",method=RequestMethod.GET)
	public ModelAndView addProduct(ModelAndView model)
	{
		    Products product = new Products();
	        model.addObject("products", product);
	        model.setViewName("adminPages/addProduct");
	        return model;
	}

	
	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public @ResponseBody ModelAndView uploadFileHandler(@ModelAttribute Products products,
			@RequestParam("file") MultipartFile file ,HttpServletRequest request) {
	  
			if(!file.isEmpty())
			{
				try {
					products.setImage(file.getBytes());
					products.setImg_name(file.getOriginalFilename());
				} catch (IOException e) {
					System.out.println("io exception exploree it");
					e.printStackTrace();
				}
				
			}
	
		
		int result=adminService.addProductDetail(products);
		
		
		if(result==1)
		return new ModelAndView ( "redirect:/adminHome");
		else
		return new ModelAndView  ( "redirect:/addProduct");
	}
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession session)
	{

	
	session.removeAttribute("USER");
	if (session != null) {
	    session.invalidate();
	}
	
	    return new ModelAndView( "redirect:/admin");
	}
	
	
	
}
