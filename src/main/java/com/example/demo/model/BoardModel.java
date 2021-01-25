package com.example.demo.model;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class BoardModel {

	private int id;
	
	private String title;
	
	private String writer;
	
	private String content;
	
	private String today;
	
}
