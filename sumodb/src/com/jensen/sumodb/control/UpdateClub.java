package com.jensen.sumodb.control;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.jensen.sumodb.model.Club;
import com.jensen.sumodb.model.SumoDatabaseUtility;

/**
 * Servlet implementation class UpdateClub
 */
@WebServlet("/UpdateClub")
public class UpdateClub extends HttpServlet {
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
    public UpdateClub() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Club updateClub = sumoDbUtil.getSingleClub(Integer.parseInt(request.getParameter("clubId")));
		
		request.setAttribute("UPDATE_CLUB", updateClub);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/updateClub.jsp");
		dispatcher.forward(request, response);
		
	}
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Club updateClub;
		
		int id = Integer.parseInt(request.getParameter("clubId"));
		String name = request.getParameter("clubName");
		String startingYear = request.getParameter("startingYear");
		String city = request.getParameter("city");
		
		updateClub = new Club(id, name, startingYear, city);
		
		sumoDbUtil.updateClub(updateClub);
		
		response.sendRedirect("ListAllClubs");
		
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
