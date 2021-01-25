package com.example.demo.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.BoardMapper;
import com.example.demo.model.BoardModel;
import com.example.demo.util.PagingVO;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	public int countBoard() {
		return boardMapper.countBoard();
	}
	
	public List<String> getBoard(PagingVO vo) {
		return boardMapper.getBoard(vo.getStart()+"",vo.getEnd()+"");
	}
	
	public String getContent(String row) {
		return boardMapper.getContent(row);
	}
	
	public String deleteBoard(String row) {
		boardMapper.deleteBoard(row);
		return "success";
	}
	
	public List<String> boardAll(String row) {
		return boardMapper.boardAll(row);
	}
	
	public String updateBoard(String row, String title, String content) {
		boardMapper.updateBoard(row, title, content);
		return "success";
	}

	public String inserBoard(String title, String writer, String content) {
		
		boardMapper.insertBoard(title, writer, content);
		return "success";
		
	}
	
}
