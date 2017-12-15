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

import com.jensen.sumodb.model.Club;
import com.jensen.sumodb.model.SumoDatabaseUtility;

/**
 * Servlet implementation class ListAllClubs
 */
@WebServlet("/ListAllClubs")
public class ListAllClubs extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	private SumoDatabaseUtility sumoDbUtil;
	
	@Resource(name="jdbc/sumo")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		
		try {
			sumoDbUtil = new SumoDatabaseUtility(dataSource);
		}
		catch(Exception e) {
			throw new ServletException(e);
		}
	}
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListAllClubs() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get clubs from db util
		LinkedList<Club> allClubs = sumoDbUtil.readAllClubs();
				
		// add clubs to the request
		request.setAttribute("ALL_CLUBS", allClubs);
				
		// send to JSP page
		RequestDispatcher dispatcher = request.getRequestDispatcher("/clubs.jsp");
		dispatcher.forward(request, response);
	}

}
