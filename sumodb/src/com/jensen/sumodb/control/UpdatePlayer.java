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
import com.jensen.sumodb.model.Player;
import com.jensen.sumodb.model.SumoDatabaseUtility;
import com.jensen.sumodb.model.SumoRanks;

/**
 * Servlet implementation class UpdatePlayer
 */
@WebServlet("/UpdatePlayer")
public class UpdatePlayer extends HttpServlet {
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
    public UpdatePlayer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("ENUM_SUMO_RANKS", SumoRanks.values());
		
		Player updatePlayer = sumoDbUtil.getSinglePlayer(Integer.parseInt(request.getParameter("playerId")));
		request.setAttribute("UPDATE_PLAYER", updatePlayer);
		
		LinkedList<Coach> allCoaches = sumoDbUtil.readAllCoaches();
		request.setAttribute("ALL_COACHES", allCoaches);
		
		LinkedList<Club> allClubs = sumoDbUtil.readAllClubs();
		request.setAttribute("ALL_CLUBS", allClubs);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("updatePlayer.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Player updatePlayer;
		
		int id = Integer.parseInt(request.getParameter("playerId"));
		String name = request.getParameter("name");
		int heightCm = Integer.parseInt(request.getParameter("heightCm"));
		int weightKg = Integer.parseInt(request.getParameter("weightKg"));
		String birthdate = request.getParameter("birthdate");
		String nativeCity = request.getParameter("nativeCity");
		String rank = request.getParameter("selectedRank");
		int coachId = Integer.parseInt(request.getParameter("selectedCoach"));
		int clubId = Integer.parseInt(request.getParameter("selectedClub"));
		
		updatePlayer = new Player(id, name, heightCm, weightKg, birthdate, nativeCity, rank, coachId, clubId);
		
		sumoDbUtil.updatePlayer(updatePlayer);
		
		response.sendRedirect("ListAllPlayers");
	}

}
