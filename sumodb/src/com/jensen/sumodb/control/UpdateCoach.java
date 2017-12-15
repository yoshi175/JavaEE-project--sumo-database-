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
 * Servlet implementation class UpdateCoach
 */
@WebServlet("/UpdateCoach")
public class UpdateCoach extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	SumoDatabaseUtility sumoDbUtil;
	
	@Resource(name="jdbc/sumo")
	DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		sumoDbUtil = new SumoDatabaseUtility(dataSource);
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCoach() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("ENUM_SUMO_RANKS", SumoRanks.values());
		
		Coach updateCoach = sumoDbUtil.getSingleCoach(Integer.parseInt(request.getParameter("coachId")));
		request.setAttribute("UPDATE_COACH", updateCoach);
		
		LinkedList<Club> allClubs = sumoDbUtil.readAllClubs();
		request.setAttribute("ALL_CLUBS", allClubs);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("updateCoach.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Coach updateCoach;
		
		int id = Integer.parseInt(request.getParameter("coachId"));
		String name = request.getParameter("coachName");
		String birthdate = request.getParameter("birthdate");
		String highestRank = request.getParameter("selectedRank");
		int competitiveMatches = Integer.parseInt(request.getParameter("competitiveMatches"));
		int competitiveWins = Integer.parseInt(request.getParameter("competitiveWins"));
		int competitiveLosses = Integer.parseInt(request.getParameter("competitiveLosses"));
		String retiredFromCompeting = request.getParameter("retiredFromCompeting");
		int clubId = Integer.parseInt(request.getParameter("selectedClub"));
		
		updateCoach = new Coach(id, name, birthdate, highestRank, competitiveMatches, competitiveWins, competitiveLosses, retiredFromCompeting, clubId);
		
		sumoDbUtil.updateCoach(updateCoach);
		
		response.sendRedirect("ListAllCoaches");
	}

}
