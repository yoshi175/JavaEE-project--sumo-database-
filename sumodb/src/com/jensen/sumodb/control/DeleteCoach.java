package com.jensen.sumodb.control;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.jensen.sumodb.model.Coach;
import com.jensen.sumodb.model.SumoDatabaseUtility;

/**
 * Servlet implementation class DeleteCoach
 */
@WebServlet("/DeleteCoach")
public class DeleteCoach extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	SumoDatabaseUtility sumoDbUtil;
	
	@Resource(name="jdbc/sumo")
	DataSource dataSource;
	
	
    @Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		
		sumoDbUtil = new SumoDatabaseUtility(dataSource);
	}

	/**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCoach() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Coach deleteCoach = sumoDbUtil.getSingleCoach(Integer.parseInt(request.getParameter("coachId")));
		
		sumoDbUtil.deleteCoach(deleteCoach);
		
		response.sendRedirect("ListAllCoaches");
	}

}
