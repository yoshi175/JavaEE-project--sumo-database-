package com.jensen.sumodb.control;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.jensen.sumodb.model.Club;
import com.jensen.sumodb.model.SumoDatabaseUtility;

/**
 * Servlet implementation class addClub
 */
@WebServlet("/AddClub")
public class AddClub extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private SumoDatabaseUtility sumoDbUtil;
	
	@Resource(name="jdbc/sumo")
	private DataSource dataSource;
	
	
    @Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		
		sumoDbUtil = new SumoDatabaseUtility(dataSource);
	}

	/**
     * @see HttpServlet#HttpServlet()
     */
    public AddClub() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("clubName");
		String startingYear = request.getParameter("startingYear");
		String city = request.getParameter("city");
		
		Club newClub = new Club(name, startingYear, city);
		
		sumoDbUtil.createClub(newClub);
		
		response.sendRedirect("ListAllClubs");
	}

}
