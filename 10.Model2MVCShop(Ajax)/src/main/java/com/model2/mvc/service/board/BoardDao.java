package com.model2.mvc.service.board;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Board;


public interface BoardDao {
	
	//1. �Խñ� �ۼ�
	public void create(Board board) throws Exception;
	
	//2. �Խñ� �󼼺���
	public Board read(int bno) throws Exception;

	//3. �Խñ� ����
	public void update(Board board) throws Exception;

	//4. �Խñ� ����
	public void delete(int bno) throws Exception;

	//5. �Խñ� ��ü ���
	public List<Board> listAll() throws Exception;
	
	//6. �Խñ� ��ȸ ����
	public void increaseViewcnt(int bno) throws Exception;
	
}