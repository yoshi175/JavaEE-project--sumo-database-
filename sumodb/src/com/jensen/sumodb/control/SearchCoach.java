package com.jensen.sumodb.control;

import java.io.IOException;
import java.util.LinkedList;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.jensen.sumodb.model.Coach;
import com.jensen.sumodb.model.SumoDatabaseUtility;

/**
 * Servlet implementation class SearchClub
 */
@WebServlet("/SearchCoach")
public class SearchCoach extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	SumoDatabaseUtility sumoDbUtil;
	
	@Resource(name="jdbc/sumo")
	DataSource dataSource;
	
	public void init() throws ServletException {
		super.init();
		
		sumoDbUtil = new SumoDatabaseUtility(dataSource);
	}
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchCoach() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchValue = request.getParameter("searchValue");
		
		LinkedList<Coach> customCoachList = sumoDbUtil.searchCoach(searchValue);
		
		request.setAttribute("ALL_COACHES", customCoachList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("coaches.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
