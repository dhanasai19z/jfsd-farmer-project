package com.klu.jfsd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.klu.jfsd.model.Farmer;
import com.klu.jfsd.model.Product;
import com.klu.jfsd.model.User;
import com.klu.jfsd.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("userregister")
    public ModelAndView showRegistrationForm() {
        return new ModelAndView("userregestration");
    }
    @PostMapping("checkuserregister")
    public ModelAndView handleRegistration(HttpServletRequest request) {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String state = request.getParameter("state");
        String image = request.getParameter("imageUrl");

        User user = new User();
        user.setName(name);
        user.setPhone(phone);
        user.setUsername(username);
        user.setPassword(password);
        user.setAddress(address);
        user.setState(state);
        user.setImageUrl(image);
        
        String message = userService.userRegistration(user);
        ModelAndView mv = new ModelAndView("userregsuccesslogin");
        mv.addObject("message", message);

        return mv;
    }
    @GetMapping("userlogin")
    public ModelAndView showLoginForm() {
    	ModelAndView mv = new ModelAndView();
		mv.setViewName("userlogin");
		return mv;
    }
    @PostMapping("checkuserlogin")
    public ModelAndView loginAction(HttpServletRequest request , HttpSession session) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        ModelAndView mv = new ModelAndView();
        User user = userService.checkUserLogin(username, password);
        
        if (user != null) {
        	
        	
        	if (user.isUserApproval()) {
        		session.setAttribute("user", user);
                mv.setViewName("userhome");
            } else {
            
                mv.setViewName("useraprovalpending");
            }
            
        } else {
            mv.setViewName("userlogin");
            mv.addObject("message", "login failed");
        }
        return mv;
    }

   
    
    
    
    
    
    
    
    @GetMapping("userhome")
    public ModelAndView userHome() {
        return new ModelAndView("userhome");
    }
    
    
    
    
    
    //nav-bar function......................................................................>
    @GetMapping("userviewallfarmers")
    public ModelAndView userViewAllFarmers() {
    	ModelAndView modelAndView = new ModelAndView("userviewallfarmers");
        List<Farmer> farmers = userService.viewAllFarmers();
        if (farmers == null || farmers.isEmpty()) {
            System.out.println("No farmers found!"); // Debugging
        }
        modelAndView.addObject("farmerslist", farmers);
        return modelAndView;
    }
    @GetMapping("userviewallproducts")
    public ModelAndView userviewallproducts() {
    	ModelAndView modelAndView = new ModelAndView("userviewallproducts");
        List<Product> products = userService.viewAllProducts();
        if (products == null || products.isEmpty()) {
            System.out.println("No products found!"); // Debugging
        }
        modelAndView.addObject("productslist", products);
        return modelAndView;
    }
    
    
    @GetMapping("userbuyproducts")
    public ModelAndView userbuyproducts() {
    	ModelAndView modelAndView = new ModelAndView("userbuyproducts");
        List<Product> products = userService.viewAllProducts();
        if (products == null || products.isEmpty()) {
            System.out.println("No products found!"); // Debugging
        }
        modelAndView.addObject("productslist", products);
        return modelAndView;
    }
    
    
    
    
    
    @GetMapping("/filterproducts")
    public ModelAndView filterProducts(@RequestParam("specification") String specification) {
        // Fetch the filtered products based on the type parameter
    	List<Product> filteredProducts = userService.getProductsBySpecification(specification);
        if (filteredProducts == null || filteredProducts.isEmpty()) {
            System.out.println("No products found!"); // Debugging
        }
        // Create a new ModelAndView object
        

        // Add filtered products to the model
        ModelAndView modelAndView = new ModelAndView("userbuyproducts");

        
        modelAndView.addObject("productslist", filteredProducts);

        return modelAndView;
    }
  
    
   
    
  
    /*@GetMapping("userbuyproducts")
    public ModelAndView filterProducts(@RequestParam(value = "type", required = false) String type) {
        List<Product> products;
        if (type == null || type.isEmpty()) {
            products = userService.viewAllProducts();
        } else {
            products = userService.getProductsByType(type);
        }
        ModelAndView mav = new ModelAndView("userbuyproducts");
        mav.addObject("productslist", products);
        return mav;
    }*/

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //update password................................................................................>\
    
    @GetMapping("/user/forgetpassword")
    public ModelAndView forgetPassword() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("userForgetPassword");
        return mv;
    }

    @PostMapping("/user/validateUser")
    public ModelAndView validateUser(
            @RequestParam("username") String username,
            @RequestParam("phone") String phone) {

        ModelAndView modelAndView = new ModelAndView();

        // Find user by username and phone number
        User user = userService.findByUsernameAndPhone(username, phone);

        if (user != null && user.isUserApproval()) {
            // Set approval to false for admin re-verification
            user.setUserApproval(false);
            userService.updateUser(user);

            // Redirect to the set password page
            modelAndView.setViewName("redirect:/user/setPassword?username=" + username);
        } else {
            // If invalid, return to the forgot password page with a message
            modelAndView.setViewName("userForgetPassword");
            modelAndView.addObject("message", "Invalid username or phone number.");
        }

        return modelAndView;
    }

    @GetMapping("/user/setPassword")
    public ModelAndView setPasswordPage(@RequestParam("username") String username) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userSetPassword");
        modelAndView.addObject("username", username);
        return modelAndView;
    }

    @PostMapping("/user/updatePassword")
    public ModelAndView updatePassword(
            @RequestParam("username") String username,
            @RequestParam("newPassword") String newPassword,
            @RequestParam("confirmPassword") String confirmPassword) {

        ModelAndView modelAndView = new ModelAndView();

        // Check if passwords match
        if (!newPassword.equals(confirmPassword)) {
            modelAndView.setViewName("userSetPassword");
            modelAndView.addObject("message", "Passwords do not match!");
            return modelAndView;
        }

        // Find the user by username
        User user = userService.findByUsername(username);
        if (user != null) {
            user.setPassword(newPassword); // Set new password
            userService.updateUser(user);

            // Redirect to login page after password reset
            modelAndView.setViewName("redirect:/userlogin");
        } else {
            modelAndView.setViewName("userSetPassword");
            modelAndView.addObject("message", "User not found!");
        }

        return modelAndView;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //update profiel
    @GetMapping("userupdateprofile")
    public ModelAndView viewProfile(HttpSession session) {
    	 User loggedUser = (User) session.getAttribute("user");
        if (loggedUser == null) {
            return new ModelAndView("redirect:/userlogin");
        }

        
        ModelAndView modelAndView = new ModelAndView("userupdateprofile");
        modelAndView.addObject("user", loggedUser);
        return modelAndView;
    }
   
        @PostMapping( "updateuserprofile")
        public ModelAndView updateUserProfile(@RequestParam("password") String password,
                                              @RequestParam("name") String name,
                                              @RequestParam("email") String username,
                                              @RequestParam("phone") String phone,
                                              @RequestParam("address") String address,
                                              @RequestParam("state") String state,
                                              HttpSession session,
                                              RedirectAttributes redirectAttributes) {

            ModelAndView modelAndView = new ModelAndView();

            // Get the user from the session
            User currentUser = (User) session.getAttribute("user");

            // If user is null, it means the user is not logged in, handle accordingly
            if (currentUser == null) {
                modelAndView.addObject("error", "Please log in first.");
                modelAndView.setViewName("userlogin");  // Redirect to login page
                return modelAndView;
            }

            // Verify password
            if (!userService.verifyPassword(currentUser, password)) {
                modelAndView.addObject("error", "Invalid password. Please try again.");
                modelAndView.setViewName("updateprofile");  // Return to the update profile page with an error
                return modelAndView;
            }

            // Update user details
            currentUser.setName(name);
            currentUser.setUsername(username);
            currentUser.setPhone(phone);
            currentUser.setAddress(address);
            currentUser.setState(state);
            //try  to make the approval to false

            // Save the updated user details in the database
           String message = userService.updateUser(currentUser);
           redirectAttributes.addFlashAttribute("message", message );
            // Successfully updated, redirect to login page
            modelAndView.setViewName("redirect:/userupdateprofile");  // Redirect to login page after successful update
            return modelAndView;
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        @RequestMapping("userlogout")
        public String logout(HttpSession session) {
            // Invalidate the session
            session.invalidate();

            // Optionally, redirect to a login page or home page after logout
            return "redirect:/userlogin";
    }

} 
    
