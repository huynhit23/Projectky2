package btl.font_end;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Map;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import btl.dao.DaoAll;
import btl.dao.DaoCat;
import btl.dao.DaoFollow;
import btl.dao.DaoPro;
import btl.entities.Cart;
import btl.entities.Categories;
import btl.entities.Follow;
import btl.entities.OrderDetail;
import btl.entities.Orders;
import btl.entities.Products;
import btl.entities.Account;
import btl.entities.Account_roles;
import btl.entities.Role;

@Controller
public class HomeFont_end {
	@Autowired
	private DaoPro daoPro;

	@Autowired
	private DaoCat cat;

	@Autowired
	private DaoAll<Account> accountDao;
	@Autowired
	private DaoAll<Role> roleDao;
	@Autowired
	private DaoAll<Account_roles> arDao;
	@Autowired
	private DaoAll<Orders> orDao;
	@Autowired
	private DaoAll<OrderDetail> ordDao;

	@Autowired
	private DaoFollow followDao;

	@RequestMapping(value = { "/", "home" })
	public String home(Model model) {

		List<Products> listAll = daoPro.getAll();
		model.addAttribute("listAll", listAll);
		List<Products> listfeatured = daoPro.getFeatured();
		model.addAttribute("listFeatured", listfeatured);
		List<Products> listnew = daoPro.getNewProduct();
		model.addAttribute("listNew", listnew);
		List<Categories> listCat = cat.getCate();
		model.addAttribute("listCat", listCat);

		return "font-end/home";
	}

	@RequestMapping("shop")
	public String shop(@RequestParam("catId") Integer catId, Model model) {

		List<Products> listAll = daoPro.getAll();
		model.addAttribute("listAll", listAll);
		List<Products> listbest = daoPro.getBestSellerList();
		model.addAttribute("listBest", listbest);
		List<Products> listsale = daoPro.getSale();
		model.addAttribute("listSale", listsale);
		List<Products> listnew = daoPro.getNewProduct();
		model.addAttribute("listNew", listnew);
		List<Products> listCatId = daoPro.getCatId(catId);
		model.addAttribute("listCatId", listCatId);

		List<Categories> listCat = cat.getCate();
		model.addAttribute("listCat", listCat);

		model.addAttribute("catId", catId);
		return "font-end/shop";
	}

	@RequestMapping("/search")
	public String search(@RequestParam("name") String name, Model model) {

		List<Products> listAll = daoPro.getAll();
		model.addAttribute("listAll", listAll);
		List<Products> listbest = daoPro.getBestSellerList();
		model.addAttribute("listBest", listbest);
		List<Products> listsale = daoPro.getSale();
		model.addAttribute("listSale", listsale);
		List<Products> listnew = daoPro.getNewProduct();
		model.addAttribute("listNew", listnew);
//		List<Products> listCatId = daoPro.getCatId(catId);
//		model.addAttribute("listCatId", listCatId);

		List<Categories> listCat = cat.getCate();
		model.addAttribute("listCat", listCat);

		List<Products> list = daoPro.findByName(name);
		model.addAttribute("list", list);
		model.addAttribute("name", name);
		return "font-end/search";
	}
	

	@RequestMapping("detail")
	public String detail(@RequestParam("proId") Long proId, Model model) {

		Cart cart = new Cart();
		model.addAttribute("cart", cart);

		Products proDetail = daoPro.findById(proId);
		model.addAttribute("pro", proDetail);

		List<Follow> followPro = followDao.getProId(proId);
		model.addAttribute("followPro", followPro);

		List<Products> listAll = daoPro.getAll();
		model.addAttribute("listAll", listAll);

		List<Categories> listCat = cat.getCate();
		model.addAttribute("listCat", listCat);

		return "font-end/detail";
	}

	@RequestMapping("/set")
	public String set(@RequestParam("set") String set, Model model) {
		
		List<Products> listbest = daoPro.getBestSellerList();
		model.addAttribute("listBest", listbest);
		List<Products> listnew = daoPro.getNewProduct();
		model.addAttribute("listNew", listnew);
		
		List<Categories> listCat = cat.getCate();
		model.addAttribute("listCat", listCat);
		
		List<Products> list = daoPro.getSets(set);
		model.addAttribute("list", list);
		model.addAttribute("set", set);
		return "font-end/set";
	}
	
//	Follow
	@RequestMapping("addFollow")
	public String addFollow(@ModelAttribute("f") Follow follow, @RequestParam("accName") String accName, Model model) {

		Account acc = accountDao.findByName(accName);
		Account acc2 = accountDao.findById(acc.getId());
		follow.setAccId(acc2);

//		Products pId =  daoPro.findById(follow.getProId().getId());
		List<Follow> followPro = followDao.getProId(follow.getProId().getId());
//		
//		List<Follow> followAcc = followDao.getAccId(acc2);
		for (Follow follow2 : followPro) {
			if (follow2.getProId().getId() == follow.getProId().getId()
					&& follow2.getAccId().getId() == follow.getAccId().getId()) {
				followDao.delete(follow2.getId());
				follow.getProId();
				model.addAttribute("pro", follow.getProId());
				model.addAttribute("delete", "Đã bỏ theo dõi");
				return "redirect:/follow";
			}
		}

		followDao.insert(follow);
		follow.getProId();
		model.addAttribute("pro", follow.getProId());
		model.addAttribute("add", "Đã theo dõi thành công");
		return "redirect:/follow";
	}

	@RequestMapping("follow")
	public String follow(Model model) {
		List<Follow> listFl = followDao.getAll();
		model.addAttribute("listFl", listFl);

		return "font-end/follow";
	}

	@RequestMapping("delete")
	public String delete(Model model, @RequestParam("flId") Long flId) {
		boolean bl = followDao.delete(flId);
		if (bl) {
			model.addAttribute("delete", "Đã bỏ theo dõi");
		}

		List<Follow> listFl = followDao.getAll();
		model.addAttribute("listFl", listFl);

		return "font-end/follow";
	}

//	GIỎ HÀNG
	@RequestMapping("cart")
	public String cart(Model model) {

		model.addAttribute("cartU", new Cart());

		List<Categories> listCat = cat.getCate();
		model.addAttribute("listCat", listCat);

		return "font-end/cart";
	}

	@RequestMapping("/AddToCart")
	public String addToCart(@RequestParam("proId") Long proId, @ModelAttribute("cart") Cart cart, HttpSession session) {
		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		Products pro = daoPro.findById(proId);
		if (pro != null) {
			if (cartItems.containsKey(proId)) {
				Cart item = cartItems.get(proId);
				item.setPro(pro);
				item.setQuantity(item.getQuantity() + 1);
				cartItems.put(proId, item);
			} else {
				Cart item = new Cart();
				item.setPro(pro);
				item.setQuantity(cart.getQuantity());

				cartItems.put(proId, item);
			}
		}
		session.setAttribute("myCartItems", cartItems);
		session.setAttribute("myCartTotal", totalPrice(cartItems));
		session.setAttribute("myCartItem", totalItem(cartItems));
		return "redirect:/cart";
	}

	@RequestMapping("/removeItem")
	public String viewRemove(@RequestParam("proId") Long proId, HttpSession session) {
		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		if (cartItems.containsKey(proId)) {
			cartItems.remove(proId);
		}
		session.setAttribute("myCartItems", cartItems);
		return "redirect:/cart";
	}

	@RequestMapping("/clearCart")
	public String viewClear(HttpSession session) {
		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		cartItems.clear();
		session.setAttribute("myCartItems", cartItems);
		session.setAttribute("myCartTotal", totalPrice(cartItems));
		session.setAttribute("myCartItem", totalItem(cartItems));
		session.setAttribute("myCartNumber", cartItems.size());
		return "redirect:/cart";
	}

	public double totalPrice(HashMap<Long, Cart> cartItems) {
		int count = 0;
		for (Map.Entry<Long, Cart> list : cartItems.entrySet()) {
			if (list.getValue().getPro().getSalePrice() == 0) {
				count += list.getValue().getPro().getPrice() * list.getValue().getQuantity();
			} else {
				count += list.getValue().getPro().getSalePrice() * list.getValue().getQuantity();
			}
		}
		return count;
	}

	public int totalItem(HashMap<Long, Cart> cartItems) {
		int count = 0;
		for (Map.Entry<Long, Cart> list : cartItems.entrySet()) {
			count += list.getValue().getQuantity();
		}
		return count;
	}

	@RequestMapping("/updateCart")
	public String viewUpdate(@RequestParam("proId") Long proId, @ModelAttribute("cartU") Cart cart,
			HttpSession session) {
		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}

		if (cartItems.containsKey(proId)) {
			Cart item = cartItems.get(proId);
			item.setQuantity(cart.getQuantity());
			cartItems.put(proId, item);
			if (item.getQuantity() == 0) {
				cartItems.remove(proId);
			}
		}
		session.setAttribute("myCartItems", cartItems);
		session.setAttribute("myCartTotal", totalPrice(cartItems));
		session.setAttribute("myCartItem", totalItem(cartItems));
		return "redirect:/cart";
	}

//		Đặt hàng
	@RequestMapping("checkOut")
	public String checkOut(@RequestParam("userName") String userName, Model model) {

		model.addAttribute("cartU", new Cart());

		Account acc = accountDao.findByName(userName);
		model.addAttribute("acc", acc);

		List<Categories> listCat = cat.getCate();
		model.addAttribute("listCat", listCat);

		model.addAttribute("orders", new Orders());

		return "font-end/checkOut";
	}

	@RequestMapping("CheckOut2")
	public String checkOut(@ModelAttribute("orders") Orders orders, Model model, HttpServletRequest request,
			HttpSession session) {
		java.util.Date date1 = new java.util.Date();
		orders.setOrderDate(date1);

		boolean bl = orDao.insert(orders);
		if (bl) {
			// cho nay thieu insert vao orderdetail
			HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
			// duyệt cái này, lưu dữ liệu vào bảng orderdetail.
			for (Map.Entry<Long, Cart> list : cartItems.entrySet()) {
				OrderDetail ord = new OrderDetail();
				ord.setOrder(orders);
				Products pro = daoPro.findById(list.getValue().getPro().getId());
				ord.setProO(pro);
				ord.setQuantity(list.getValue().getQuantity());
				if (list.getValue().getPro().getSalePrice() == 0) {
					ord.setPrice(list.getValue().getPro().getPrice());
				} else {
					ord.setPrice(list.getValue().getPro().getSalePrice());
				}
				ord.setStatus(0);

				ordDao.insert(ord);
				cartItems.clear();
			}
			return "redirect:/orderDETAIL";
		} else {
			model.addAttribute("err", "Thanh toán thất bại!");
			model.addAttribute("orders", orders);
			return "font-end/checkOut";
		}
	}

	@RequestMapping("orderDETAIL")
	public String orderDETAIL(Model model) {
		List<Orders> listOd = orDao.getAll();
		model.addAttribute("listOd", listOd);
		
		List<OrderDetail> listOdd = ordDao.getAll();
		model.addAttribute("listOdd", listOdd);

		return "font-end/orderDETAIL";
	}

//	Đăng Ký Tài khoản
	@RequestMapping("/register")
	public String registerPage(Model model) {
		Account ac = new Account();
		model.addAttribute("ac", ac);
		return "font-end/register";
	}

	@RequestMapping("/createAccount")
	public String createAccount(@RequestParam("confirmPassword") String cp, @Valid @ModelAttribute("ac") Account accout,
			BindingResult result, Model model) {

		accout.setEnabled(true);

		if (result.hasErrors()) {
			model.addAttribute("ac", accout);
			return "font-end/register";
		} else if (!accout.getPassword().equalsIgnoreCase(cp)) {

			model.addAttribute("err", "Mật khẩu không phù hợp");
			return "font-end/register";
		} else {

			Account_roles ar = new Account_roles();
			String rl = "ROLE_USER";
			Role role = roleDao.findByName(rl);
			ar.setAc(accout);
			ar.setRole(role);

			boolean bl = accountDao.insert(accout);
			boolean bl2 = arDao.insert(ar);
			if (bl & bl2) {
				model.addAttribute("done", "Tạo tài khoản thành công");
				return "font-end/login";
			} else {
				model.addAttribute("err", "Có lỗi Tạo không thành công!");
				return "font-end/register";
			}
		}
	}

// Đăng Nhập và Đăng Xuất
	@RequestMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error, Model model) {
		if (error != null) {
			model.addAttribute("mess", "Đăng nhập thất bại!");
		}
		return "font-end/login";
	}

	@RequestMapping("/logout")
	public String logout(Model model) {
		model.addAttribute("mess", "Đăng xuất thành công");
		return "font-end/login";
	}

	@RequestMapping("/contact")
	public String contact(Model model) {
		List<Categories> listCat = cat.getCate();
		model.addAttribute("listCat", listCat);
		return "font-end/contact";

	}

	@RequestMapping("/blog")
	public String blog(Model model) {
		List<Categories> listCat = cat.getCate();
		model.addAttribute("listCat", listCat);
		return "font-end/blog";

	}

	
}
