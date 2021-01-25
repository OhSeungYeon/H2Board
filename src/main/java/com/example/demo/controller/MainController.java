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

	// �Խ��� ����������
    @RequestMapping("/")
	public ModelAndView getMain() {
    	
    	ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
		
	}
    
	// �Խ��� �� ���
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
	
	//�Խ��� ���� ��ȸ�ϱ�
	@RequestMapping(value="/getContent" , method=RequestMethod.GET)
    public Map<String, String> getContent(@RequestParam("row") String row) throws Exception{
    	
    	Map<String, String> result = new HashMap<>();
    	result.put("data", boardService.getContent(row));
		return result;
		
    } 
	
	// �Խ��� �� �����ϱ�
	@RequestMapping(value="/deleteBoard" , method=RequestMethod.GET)
    public Map<String, String> deleteBoard(@RequestParam("row") String row) throws Exception{
    	
    	Map<String, String> result = new HashMap<>();
    	result.put("data", boardService.deleteBoard(row));
		return result;
		
    }
	
	// �� �ۼ� ������
	@RequestMapping("/moveInsertBoard.do") 
  	public ModelAndView moveInsertBoard()throws Exception{
  		ModelAndView mv = new ModelAndView();
		mv.setViewName("insertBoard");
		return mv;
  	}
	
	// �� �ۼ�
	@PostMapping("/insertBoard")
    public Map<String, String> insertBoard(@RequestParam("title") String title,
    									   @RequestParam("writer") String writer,
    									   @RequestParam("content") String content) throws Exception{
    	
    	Map<String, String> result = new HashMap<>();
    	result.put("data", boardService.inserBoard(title, writer, content));
		return result;
		
    } 
	
	// �� ���� ������ 
  	@RequestMapping(value="/updateBoard.do", method=RequestMethod.GET)
  	public ModelAndView modBoard() {
  		
  		ModelAndView mv = new ModelAndView();	
		mv.setViewName("updateBoard");
		return mv;
		
  	}
  	
  	// �ش� ���� ��� ���� ��������
  	@RequestMapping(value="/boardAll" , method=RequestMethod.GET)
	@ResponseBody
    public Object boardAll(@RequestParam("row") String row) throws Exception{

		List<String> list = boardService.boardAll(row);
		Map<String, Object> retval = new HashMap<String, Object>();
		retval.put("list", list);
		return retval;
		
    }
  	
	// �� ����
  	@RequestMapping(value="/updateBoard", method=RequestMethod.GET)
  	public Map<String, String> updateBoard(@RequestParam("row") String row,
  			 							   @RequestParam("title") String title, 
  			 							   @RequestParam("content") String content) {
  		
  		Map<String, String> result = new HashMap<>();
    	result.put("data", boardService.updateBoard(row, title, content));
		return result;
		
  	}
  
}
