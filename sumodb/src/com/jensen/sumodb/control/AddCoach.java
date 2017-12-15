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
import com.jensen.sumodb.model.Coach;
import com.jensen.sumodb.model.SumoDatabaseUtility;
import com.jensen.sumodb.model.SumoRanks;

/**
 * Servlet implementation class addCoach
 */
@WebServlet("/AddCoach")
public class AddCoach extends HttpServlet {
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
    public AddCoach() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("ENUM_SUMO_RANKS", SumoRanks.values());
		
		LinkedList<Club> allClubs = sumoDbUtil.readAllClubs();
		
		request.setAttribute("ALL_CLUBS", allClubs);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/addCoach.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Coach newCoach;
		
		String name = request.getParameter("coachName");
		String birthdate = request.getParameter("birthdate");
		String highestRank = request.getParameter("selectedRank");
		Integer competitiveMatches = null;
		Integer competitiveWins = null;
		Integer competitiveLosses = null;
		
		if(request.getParameter("competitiveMatches") != null) {
			competitiveMatches = Integer.parseInt(request.getParameter("competitiveMatches"));
		}
		if(request.getParameter("competitiveWins") != null) {
			competitiveWins = Integer.parseInt(request.getParameter("competitiveWins"));
		}
		if(request.getParameter("competitiveLosses") != null) {
			competitiveLosses = Integer.parseInt(request.getParameter("competitiveLosses"));
		}
		
		String retiredFromCompeting = request.getParameter("retiredFromCompeting");
		int clubId = Integer.parseInt(request.getParameter("selectedClub"));
		
		newCoach = new Coach(name, birthdate, highestRank, competitiveMatches, competitiveWins,
							competitiveLosses, retiredFromCompeting, clubId);
		
		sumoDbUtil.createCoach(newCoach);
		
		response.sendRedirect("ListAllCoaches");
		
	}

}
