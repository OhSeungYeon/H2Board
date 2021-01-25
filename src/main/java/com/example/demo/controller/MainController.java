package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.BoardModel;
import com.example.demo.service.BoardService;
import com.example.demo.util.PagingVO;

@RestController
public class MainController {

	@Autowired
	BoardService boardService;

	// 게시판 메인페이지
    @RequestMapping("/")
	public ModelAndView getMain() {
    	
    	ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
		
	}
    
	// 게시판 글 목록
	@RequestMapping(value="/getBoardList.do" , method=RequestMethod.GET)
    public ModelAndView getBoard(PagingVO vo,
    							 @RequestParam(defaultValue="1", required=false)String nowPage) {
    	
    	ModelAndView mv = new ModelAndView();
    	vo = new PagingVO(boardService.countBoard(), Integer.parseInt(nowPage), 5);
		mv.addObject("paging", vo);	
		mv.addObject("params", boardService.getBoard(vo));
		mv.setViewName("boardList");
		return mv;
		
    } 
	
	//게시판 내용 조회하기
	@RequestMapping(value="/getContent" , method=RequestMethod.GET)
    public Map<String, String> getContent(@RequestParam("row") String row) throws Exception{
    	
    	Map<String, String> result = new HashMap<>();
    	result.put("data", boardService.getContent(row));
		return result;
		
    } 
	
	// 게시판 글 삭제하기
	@RequestMapping(value="/deleteBoard" , method=RequestMethod.GET)
    public Map<String, String> deleteBoard(@RequestParam("row") String row) throws Exception{
    	
    	Map<String, String> result = new HashMap<>();
    	result.put("data", boardService.deleteBoard(row));
		return result;
		
    }
	
	// 글 작성 페이지
	@RequestMapping("/moveInsertBoard.do") 
  	public ModelAndView moveInsertBoard()throws Exception{
  		ModelAndView mv = new ModelAndView();
		mv.setViewName("insertBoard");
		return mv;
  	}
	
	// 글 작성
	@PostMapping("/insertBoard")
    public Map<String, String> insertBoard(@RequestParam("title") String title,
    									   @RequestParam("writer") String writer,
    									   @RequestParam("content") String content) throws Exception{
    	
    	Map<String, String> result = new HashMap<>();
    	result.put("data", boardService.inserBoard(title, writer, content));
		return result;
		
    } 
	
	// 글 수정 페이지 
  	@RequestMapping(value="/updateBoard.do", method=RequestMethod.GET)
  	public ModelAndView modBoard() {
  		
  		ModelAndView mv = new ModelAndView();	
		mv.setViewName("updateBoard");
		return mv;
		
  	}
  	
  	// 해당 열의 모든 정보 가져오기
  	@RequestMapping(value="/boardAll" , method=RequestMethod.GET)
	@ResponseBody
    public Object boardAll(@RequestParam("row") String row) throws Exception{

		List<String> list = boardService.boardAll(row);
		Map<String, Object> retval = new HashMap<String, Object>();
		retval.put("list", list);
		return retval;
		
    }
  	
	// 글 수정
  	@RequestMapping(value="/updateBoard", method=RequestMethod.GET)
  	public Map<String, String> updateBoard(@RequestParam("row") String row,
  			 							   @RequestParam("title") String title, 
  			 							   @RequestParam("content") String content) {
  		
  		Map<String, String> result = new HashMap<>();
    	result.put("data", boardService.updateBoard(row, title, content));
		return result;
		
  	}
  
}
