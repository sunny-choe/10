package com.model2.mvc.service.board.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.service.board.BoardDao;
import com.model2.mvc.service.board.BoardService;
import com.model2.mvc.service.domain.Board;

@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService{
	
	//Field
	@Autowired
	@Qualifier ("boardDaoImpl")
	private BoardDao boardDao;
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	///Constructor
	public BoardServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void create(Board board) throws Exception {
		
		String title = board.getTitle();
		String content = board.getContent();
		String writer = board.getWriter();
		
		title = title.replace("<", "&lt;");
		title = title.replace("<", "&gt;");
		writer = writer.replace("<", "&lt;");
		writer = writer.replace("<", "&gt;");
		
		title = title.replace(" ", "&nbsp;&nbsp;");
		writer = writer.replace(" ", "&nbsp;&nbsp;");
		
		content = content.replace("\n", "br");
		board.setTitle(title);
		board.setContent(content);
		board.setWriter(writer);
		boardDao.create(board);
	}

	public Board read(int bno) throws Exception {
		return boardDao.read(bno);
	}

	public void update(Board board) throws Exception {
		boardDao.update(board);
	}
	
	public void delete(int bno) throws Exception {
		boardDao.delete(bno);
	}
	
	public List<Board> listAll() throws Exception {
		return boardDao.listAll();
	}

	public void increaseViewcnt(int bno, HttpSession session) throws Exception {
		
		long update_time = 0;
		
		if(session.getAttribute("update_time_"+bno) != null) {
			update_time = (long)session.getAttribute("update_time_"+bno);
		}
		
		long current_time = System.currentTimeMillis();
		
		if(current_time - update_time > 5*1000) {
			boardDao.increaseViewcnt(bno);
			session.setAttribute("update_time_"+bno, current_time);
		}
	}


}