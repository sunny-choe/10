package com.model2.mvc.service.board.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.board.BoardDao;
import com.model2.mvc.service.domain.Board;
import com.model2.mvc.service.domain.Product;


//==> 회원관리 DAO CRUD 구현
@Repository("boardDaoImpl")
public class BoardDaoImpl implements BoardDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public BoardDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void create(Board board) throws Exception {
		sqlSession.insert("board.insert", board);
	}

	public Board read(int bno) throws Exception {
		return sqlSession.selectOne("board.view", bno);
	}
	
	public void update(Board board) throws Exception {
		sqlSession.update("board.updateArticle", board);
	}

	public void delete(int bno) throws Exception {
		sqlSession.delete("board.deleteArticle", bno);
	}
	
	public List<Board> listAll() throws Exception {
		return sqlSession.selectList("board.listAll");
	}

	// 게시판 Page 처리를 위한 전체 Row(totalCount)  return
	public void increaseViewcnt(int bno) throws Exception {
		sqlSession.update("board.increaseViewcnt", bno);
	}
}