package com.model2.mvc.web.product;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;


//==> 판매관리 Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}") 삼항연산자 사용하여 초기값 3으로 셋팅
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}") 삼항연산자 사용하여 초기값 2로 셋팅
	int pageSize;
	
	//@RequestMapping("/addProductView.do")
	@RequestMapping(value="addProduct", method=RequestMethod.GET)
	public String addProduct() throws Exception {

		System.out.println("/product/addProduct : GET");
		
		return "redirect:/product/addProductView.jsp";
	}
	
	//@RequestMapping("/addProduct.do")
	@RequestMapping(value="addProduct", method=RequestMethod.POST)
	public String addProduct( @ModelAttribute("product") Product product, @RequestParam("fileUpload") MultipartFile fileUpload) throws Exception {

		System.out.println("/product/addProduct : POST");
		
		String path = "C:\\Users\\user\\git\\10\\"
				+ "10.Model2MVCShop(Ajax)\\WebContent\\images\\uploadFiles\\";
		
		String originalFileName = fileUpload.getOriginalFilename();
		
		File file = new File(path + originalFileName);
		fileUpload.transferTo(file);
		
		product.setFileName(originalFileName);
		
//		System.out.println("PRODUCTDATE"+product.getManuDate());
		product.setManuDate(product.getManuDate().replaceAll("-", ""));
		//Business Logic
		productService.addProduct(product);
		
		return "forward:/product/addProductView2.jsp";
	}
	
	//@RequestMapping("/getProduct.do")
	@RequestMapping(value="getProduct", method=RequestMethod.GET)
	public String getProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception {
		
		System.out.println("/product/getProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
		model.addAttribute("product", product);
		
		return "forward:/product/getProduct.jsp";
	}
	
	//@RequestMapping("/updateProductView.do")
	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	//public String updateProductView( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{
	public String updateProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{
		System.out.println("/product/updateProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
		model.addAttribute("product", product);
		
		return "forward:/product/updateProduct.jsp";
	}
	
	//@RequestMapping("/updateProduct.do")
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product , @RequestParam("fileUpload") MultipartFile fileUpload) throws Exception{

		System.out.println("/product/updateProduct");

		String path = "C:\\Users\\user\\git\\10\\"
				+ "10.Model2MVCShop(Ajax)\\WebContent\\images\\uploadFiles\\";
		
		String originalFileName = fileUpload.getOriginalFilename();
		
		File file = new File(path + originalFileName);
		fileUpload.transferTo(file);
		
		product.setFileName(originalFileName);
		
//		System.out.println("PRODUCTDATE"+product.getManuDate());
		product.setManuDate(product.getManuDate().replaceAll("-", ""));
		
		//Business Logic
		productService.updateProduct(product);
		
		return "redirect:/product/getProduct?prodNo="+product.getProdNo();
		//return "forward:/product/updateProduct.jsp";
	}
	
	//@RequestMapping("/listProduct.do")
	@RequestMapping(value="listProduct")
	public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/product/listProduct : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp";
	}
}