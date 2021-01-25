package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface BoardMapper {

	List<String> getBoard(@Param("start") String start, @Param("end") String end);

	String getContent(@Param("row") String row);

	void deleteBoard(@Param("row") String row);
	
	List<String> boardAll(@Param("row") String row);
	
	void updateBoard(@Param("row") String row, @Param("title") String title, @Param("content") String content);

	void insertBoard(@Param("title") String title, @Param("writer") String writer, @Param("content") String content);

	int countBoard();
	
}
