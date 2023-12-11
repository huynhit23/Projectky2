package btl.back_end;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

//import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import btl.dao.DaoAll;
import btl.dao.DaoCat;
import btl.dao.DaoPro;
import btl.entities.Account;
import btl.entities.Categories;
import btl.entities.OrderDetail;
import btl.entities.Orders;
import btl.entities.Products;





@Controller
@RequestMapping("/admin")
public class HomeBackEndController {
	@Autowired
	private DaoCat daoCat;
	@Autowired
	private DaoPro daoPro;
	@Autowired
	private DaoAll<Account> accountDao;
	@Autowired
	private DaoAll<Orders> orDao;
	@Autowired
	private DaoAll<OrderDetail> ordDao;
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sd, false));
	}
	@RequestMapping(value = {"/","/home"})
	public String home() {
		return "back-end/home";
	}

	@RequestMapping("/loadCategories")
	public String loadCategories(Model model) {
		List<Categories> list = daoCat.getCate();
		model.addAttribute("list", list);
		return "back-end/cate";
	}
	@RequestMapping("/initInsertCategories")
	public String initInsertCategories(Model model) {
		Categories c = new Categories();
		model.addAttribute("c", c);
		return "back-end/insertCate";
	}
	
	@RequestMapping("/insertCategories")
	public String insertCategories(@ModelAttribute("c") Categories cat, Model model) {
		boolean bl = daoCat.insert(cat);
		if(bl) {
			List<Categories> list = daoCat.getCate();
			model.addAttribute("list", list);
			return "back-end/cate";
		}else {
			model.addAttribute("err", "Insert failed!");
			model.addAttribute("c", cat);
			return "back-end/insertCate";
		}
	}
	
	@RequestMapping("/preUpdateCategories")
	public String preUpdateCategories(@RequestParam("id")Long id, Model model) {
		Categories categories = daoCat.getCategoriesById(id);
		model.addAttribute("c", categories);
		return "back-end/updateCategories";
	}
	@RequestMapping("/updateCategories")
	public String updateCategories(@ModelAttribute("c")Categories cat, Model model) {
		boolean bl = daoCat.updateCategories(cat);
		if(bl) {
			List<Categories> list = daoCat.getCate();
			model.addAttribute("list", list);
			return "back-end/cate";
		}else {
			model.addAttribute("err", "Update failed!");
			model.addAttribute("c", cat);
			return "back-end/updateCategories";
		}
	}
	
	@RequestMapping("/deleteCategories")
	public String updateCategories(@RequestParam("id")Long id, Model model) {
		boolean bl = daoCat.deleteCategories(id);
		if(bl) {
			model.addAttribute("success", "Delete successfully!");
		}else {
			model.addAttribute("err", "Delete failed!");
		}
		
		List<Categories> list = daoCat.getCate();
		model.addAttribute("list", list);
		return "back-end/cate";
	}
	
	
	@RequestMapping("/loadProduct")
	public String loadProduct(Model model){
		List<Products> list = daoPro.getAll();
		model.addAttribute("list", list);
		
		return "back-end/list_product";
	}
	
	@RequestMapping("/initInsertProduct")
	public String initInsertProduct(Model model) {
		Products p = new Products();
		model.addAttribute("p", p);
		List<Categories> listcat = daoCat.getCate();
		model.addAttribute("listcat", listcat);
		return "back-end/insertPro";
	}
	@RequestMapping("/insertProduct")
	public String insertProduct(@ModelAttribute("pro") Products pro,@RequestParam("imgFile")MultipartFile imgFile, Model model, HttpServletRequest request) {
//		String path = request.getServletContext().getRealPath("resources/img");	
//		File f = new File(path);
//
//		File destination = new File(f.getAbsolutePath() + "/" + imgFile.getOriginalFilename());
//
//		if (!destination.exists()) {
//			try {
//				Files.write(destination.toPath(), imgFile.getBytes(), StandardOpenOption.CREATE);
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			
//		}
//		pro.setImg(imgFile.getOriginalFilename());
//
//		//
//		boolean bl = daoPro.insertProduct(pro);
//		model.addAttribute("err", "Insert failed!");
//		model.addAttribute("pro", pro);
		return "redirect:/admin/loadProduct";
		
	}
	
	@RequestMapping("/detailProduct")
	public String detailProduct(@RequestParam("proId")Long proId, Model model) {
		Products product = daoPro.findById(proId);
		model.addAttribute("p", product);
		return "back-end/detailPro";
	}
	@RequestMapping("/preUpdateProduct")
	public String preUpdateProduct(@RequestParam("proId")Long proId, Model model) {
		Products products = daoPro.findById(proId);
		model.addAttribute("p", products);
		List<Categories> listcat = daoCat.getCate();
		model.addAttribute("listcat", listcat);
		return "back-end/updateProduct";
	}
	@RequestMapping("/updateProduct")
	public String updateProduct(@ModelAttribute("p") Products pro, Model model) {
		boolean bl = daoPro.updateProduct(pro);
		if(bl) {
			return "redirect:/loadProduct";
		}else {
			model.addAttribute("err", "Update failed!");
			model.addAttribute("p", pro);
			return "back-end/updateProduct";
		}
	}
	
	@RequestMapping("/deleteProduct")
	public String deleteProduct(@RequestParam("proId")Long proId, Model model) {
		boolean bl = daoPro.deleteProduct(proId);
		if(bl) {
			model.addAttribute("success", "Delete successfully!");
		}else {
			model.addAttribute("err", "Delete failed!");
		}
		
		List<Products> list = daoPro.getAll();
		model.addAttribute("list", list);
		return "back-end/list_product";
	}
	
	
	
	@RequestMapping("/adminOrders")
	public String adminOrders(Model model,@ModelAttribute("s")Orders st){
		List<Orders> listOd = orDao.getAll();
		model.addAttribute("listOd", listOd); 
		
		List<OrderDetail> listOdd = ordDao.getAll();
		model.addAttribute("listOdd", listOdd);
		return "back-end/adminOrders";
	}
	
	@RequestMapping("/updateStatus")
	public String updateStatus(@ModelAttribute("s")Orders st, Model model) {
//		Account acc = accountDao.findById(st.getAcId().getId());
//		st.setAcId(acc);
		boolean bl = orDao.updete(st);
		if(bl) {
			List<Orders> listOd = orDao.getAll();
			model.addAttribute("listOd", listOd); 
			List<OrderDetail> listOdd = ordDao.getAll();
			model.addAttribute("listOdd", listOdd);
			return "back-end/adminOrders";
		}else {
			model.addAttribute("err", "Update Lỗi!");
			List<Orders> listOd = orDao.getAll();
			model.addAttribute("listOd", listOd); 
			List<OrderDetail> listOdd = ordDao.getAll();
			model.addAttribute("listOdd", listOdd);
			return "back-end/adminOrders";
		}
	}
	
	
	
	
	
	
	
	
}
