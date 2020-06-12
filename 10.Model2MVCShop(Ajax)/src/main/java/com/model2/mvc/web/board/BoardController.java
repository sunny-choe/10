package com.model2.mvc.web.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.board.BoardService;
import com.model2.mvc.service.domain.Board;


//==> �ǸŰ��� Controller
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	///Field
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	//setter Method ���� ����
		
	public BoardController(){
		System.out.println(this.getClass());
	}

	
	//1 �Խñ� ���
	/*
	 * @RequestMapping("list") public ModelAndView list() throws Exception {
	 * 
	 * List<Board> list = boardService.listAll();
	 * 
	 * ModelAndView mav = new ModelAndView(); mav.setViewName("/board/list");
	 * mav.addObject("list", list);
	 * 
	 * return mav; }
	 */
	@RequestMapping(value="list")
	public String list( @ModelAttribute("board") Board board , Model model , HttpServletRequest request) throws Exception{
		
		// Business logic ����
		List<Board> list = boardService.listAll();
		
				
		// Model �� View ����
		model.addAttribute("list", list);
		
		return "forward:/board/list.jsp";
	}
	//2.1 �Խñ� �ۼ�ȭ��
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String write() {
		
		return "/board/write.jsp";
	}
	//2.2 �Խñ� �ۼ�ó��
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert( @ModelAttribute Board board ) throws Exception {
		
		boardService.create(board);
		
		return "redirect:/board/list";
	}
	
	//3 �Խñ� �󼼳��� ��ȸ, �Խñ� ��ȸ�� ���� ó��
	/*
	 * @RequestMapping(value="view", method=RequestMethod.GET) public ModelAndView
	 * view( @RequestParam int bno, HttpSession session) throws Exception{
	 * 
	 * boardService.increaseViewcnt(bno, session);
	 * ModelAndView mav = new ModelAndView();
	 * mav.setViewName("/board/view");
	 * mav.addObject("board", boardService.read(bno));
	 * 
	 * return mav; }
	 */
	@RequestMapping(value="view", method=RequestMethod.GET)
	public String view( @RequestParam int bno , Model model , HttpSession session) throws Exception{
		
		// Business logic ����
		 boardService.increaseViewcnt(bno, session);
		
		// Model �� View ����
		model.addAttribute("board", boardService.read(bno));
		
		return "forward:/board/view.jsp";
	}
	
	//4. �Խñ� ����
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update( @ModelAttribute Board board) throws Exception{

		boardService.update(board);
		
		return "redirect:/board/list";
	}
	
	//5. �Խñ� ����
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String delete( @RequestParam int bno) throws Exception{
		
		boardService.delete(bno);
		
		return "redirect:/board/list";
	}
}