package com.model2.mvc.service.board;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Board;


public interface BoardDao {
	
	//1. 게시글 작성
	public void create(Board board) throws Exception;
	
	//2. 게시글 상세보기
	public Board read(int bno) throws Exception;

	//3. 게시글 수정
	public void update(Board board) throws Exception;

	//4. 게시글 삭제
	public void delete(int bno) throws Exception;

	//5. 게시글 전체 목록
	public List<Board> listAll() throws Exception;
	
	//6. 게시글 조회 증가
	public void increaseViewcnt(int bno) throws Exception;
	
}