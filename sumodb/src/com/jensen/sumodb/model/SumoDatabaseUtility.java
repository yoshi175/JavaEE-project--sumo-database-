package com.jensen.sumodb.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.sql.DataSource;

public class SumoDatabaseUtility implements SumoDAO {

	private DataSource dataSource;
	
	Connection connection;
	PreparedStatement preparedStatement;
	ResultSet resultSet;

	LinkedList<Club> clubList;
	LinkedList<Coach> coachList;
	LinkedList<Player> playerList;
	
	public SumoDatabaseUtility(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	/**
	 * This method returns a LinkedList object holding all the clubs in the database.
	 * @return a LinkedList object holding all the clubs in the database.
	 * @throws SQLException 
	 * @see Club
	 */
	public LinkedList<Club> getClubList() throws SQLException {
		return clubList;
	}

	/**
	 * This method returns a LinkedList object holding all the coaches in the database.
	 * @return a LinkedList object holding all the coaches in the database.
	 * @throws SQLException 
	 * @see Coach
	 */
	public LinkedList<Coach> getCoachList() throws SQLException {
		return coachList;
	}

	/**
	 * This method returns a LinkedList object holding all the players in the database.
	 * @return a LinkedList object holding all the players in the database.
	 * @see Player
	 */
	public LinkedList<Player> getPlayerList() {
		return playerList;
	}
	
	//Club methods
	private Club convertRowToClubObject(ResultSet resultSet) {
		Club club = new Club();
		try {
			club.setId(resultSet.getInt("id"));
			club.setName(resultSet.getString("name"));
			club.setStartingYear(resultSet.getString("starting_year"));
			club.setCity(resultSet.getString("city"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return club;
	}
	
	@Override
	public Club getSingleClub(int id) {
		Club theClub = null;
		try {
			// 1. connect to the database
			connection = dataSource.getConnection();
			
			// 2. create statement
			String sql = "SELECT * FROM sumo.club WHERE id=?";
			preparedStatement = connection.prepareStatement(sql);
			
			// 3. set parameters
			preparedStatement.setInt(1, id);
			
			// 4. get the result
			resultSet = preparedStatement.executeQuery();
			
			// 5. process the result
			while(resultSet.next()) {
				theClub = convertRowToClubObject(resultSet);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			// close all resources
			close(connection, preparedStatement, resultSet);
		}
		return theClub;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.jensen.model.SumoDAO#createClub(com.jensen.model.Club)
	 */
	@Override
	public void createClub(Club clubObject) {
		
		try {
			// 1. get a connection to the database
			connection = dataSource.getConnection();
			
			// 2. create statement
			String sql = "INSERT INTO sumo.club (name, starting_year, city) VALUES (?, ?, ?)";
			preparedStatement = connection.prepareStatement(sql);
			
			// 3. set parameters
			preparedStatement.setString(1, clubObject.getName());
			preparedStatement.setString(2, clubObject.getStartingYear());
			preparedStatement.setString(3, clubObject.getCity());
			
			// 4. execute query
			preparedStatement.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			// close all resources
			close(connection, preparedStatement, null);
		}
	}

	/*
	 * (non-Javadoc)
	 * @see com.jensen.model.SumoDAO#readAllClubs()
	 */
	@Override
	public LinkedList<Club> readAllClubs() {
		this.clubList = new LinkedList<Club>(); 
		try {
			// 1. get a connection to the database
			connection = dataSource.getConnection();
			
			// 2. create a statement
			String sql = "SELECT * FROM sumo.club ORDER BY name";
			preparedStatement = connection.prepareStatement(sql);
			
			// 3. execute the statement
			resultSet = preparedStatement.executeQuery();
			
			// 4. process the result
			while(resultSet.next()) {
				clubList.add(convertRowToClubObject(this.resultSet));
			}
			return clubList;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			// close all resources
			close(connection, preparedStatement, resultSet);
		}
		return clubList;
	}

	/*
	 * (non-Javadoc)
	 * @see com.jensen.model.SumoDAO#updateClub(com.jensen.model.Club)
	 */
	@Override
	public void updateClub(Club clubObject) {

		try {
			// 1. connect to the database
			connection = dataSource.getConnection();
			
			// 2. prepare statement
			preparedStatement = connection.prepareStatement("UPDATE sumo.club SET name=?, starting_year=?, city=? WHERE id=?");
			
			// 3. set parameters
			preparedStatement.setString(1, clubObject.getName());
			preparedStatement.setString(2, clubObject.getStartingYear());
			preparedStatement.setString(3, clubObject.getCity());
			preparedStatement.setInt(4, clubObject.getId());
			
			// 4. execute statement
			preparedStatement.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			// close all resources
			close(connection, preparedStatement, resultSet);
		}
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.jensen.model.SumoDAO#deleteClub(com.jensen.model.Club)
	 */
	@Override
	public void deleteClub(Club clubObject) {
		try {
			// 1. connect to the database
			connection = dataSource.getConnection();
			
			// 2. prepare statement
			preparedStatement = connection.prepareStatement("DELETE FROM sumo.club WHERE id=?");
			
			// 3. set parameters
			preparedStatement.setInt(1, clubObject.getId());
			
			// 4. execute statement
			preparedStatement.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			// close all resources
			close(connection, preparedStatement, null);
		}
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.jensen.model.SumoDAO#searchClub(java.lang.String)
	 */
	@Override
	public LinkedList<Club> searchClub(String name) {
		name = "%" + name + "%";
		LinkedList<Club> tempClubList = new LinkedList<>();
		this.clubList = new LinkedList<>();
		try {
			connection = dataSource.getConnection();
			
			preparedStatement = connection.prepareStatement("SELECT * FROM sumo.club WHERE name LIKE ? ORDER BY name");
			preparedStatement.setString(1, name);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				tempClubList.add(convertRowToClubObject(resultSet));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(connection, preparedStatement, null);
		}
		this.clubList = tempClubList;
		return this.clubList;
	}
	//Club methods ends ------------------------------------------------------------------------------------

	//Coach methods
	private Coach convertRowToCoachObject(ResultSet resultSet) {
		Coach coach = new Coach();
		try {
			coach.setId(resultSet.getInt("id"));
			coach.setName(resultSet.getString("name"));
			coach.setBirthdate(resultSet.getString("birthdate"));	//String to Date
			coach.setHighestRank(resultSet.getString("highest_rank"));
			coach.setCompetitiveMatches(resultSet.getInt("competitive_matches"));
			coach.setCompetitiveWins(resultSet.getInt("competitive_wins"));
			coach.setCompetitiveLosses(resultSet.getInt("competitive_losses"));
			coach.setRetiredFromCompeting(resultSet.getString("retired_from_competing"));
			coach.setClubId(resultSet.getInt("club_id"));
			coach.setClub(resultSet.getString("club_name"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return coach;
	}
	
	@Override
	public Coach getSingleCoach(int id) { //--------------------------------------------
		Coach theCoach = null;
		try {
			// 1. connect to the database
			connection = dataSource.getConnection();
			
			// 2. create statement
			String sql = "SELECT * FROM sumo.coach_join_club WHERE id=?";
			preparedStatement = connection.prepareStatement(sql);
			
			// 3. set parameters
			preparedStatement.setInt(1, id);
			
			// 4. get the result
			resultSet = preparedStatement.executeQuery();
			
			// 5. process the result
			while(resultSet.next()) {
				theCoach = convertRowToCoachObject(resultSet);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(connection, preparedStatement, resultSet);
		}
		return theCoach;
	}

	/*
	 * (non-Javadoc)
	 * @see com.jensen.model.SumoDAO#createCoach(com.jensen.model.Coach)
	 */
	@Override
	public void createCoach(Coach coachObject) {

		try {
			
			// 1. connect to the database
			connection = dataSource.getConnection();
			
			// 2. prepare statement
			preparedStatement = connection.prepareStatement("INSERT INTO sumo.coach (name, birthdate, highest_rank,"
					+ "competitive_matches, competitive_wins, competitive_losses, retired_from_competing,"
					+ "club_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
			
			// 3. set parameters
			preparedStatement.setString(1, coachObject.getName());
			preparedStatement.setString(2, coachObject.getBirthdate());	//String to Date
			preparedStatement.setString(3, coachObject.getHighestRank());
			preparedStatement.setInt(4, coachObject.getCompetitiveMatches());
			preparedStatement.setInt(5, coachObject.getCompetitiveWins());
			preparedStatement.setInt(6, coachObject.getCompetitiveLosses());
			preparedStatement.setString(7, coachObject.getRetiredFromCompeting());
			preparedStatement.setInt(8, coachObject.getClubId());
			
			// 4. execute statement
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			// close all resources
			close(connection, preparedStatement, null);
		}
	}

	/*
	 * (non-Javadoc)
	 * @see com.jensen.model.SumoDAO#readAllCoaches()
	 */
	@Override
	public LinkedList<Coach> readAllCoaches() {
		this.coachList = new LinkedList<Coach>(); 
		try {
			// 1. connect to the database
			connection = dataSource.getConnection();
			
			// 2. create a statement
			String sql = "SELECT * FROM sumo.coach_join_club ORDER BY name";
			preparedStatement = connection.prepareStatement(sql);
			
			// 3. execute the statement
			resultSet = preparedStatement.executeQuery();
			
			// 4. process the result
			while(resultSet.next()) {
				coachList.add(convertRowToCoachObject(this.resultSet));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			// close all resources
			close(connection, preparedStatement, resultSet);
		}
		return coachList;
	}

	/*
	 * (non-Javadoc)
	 * @see com.jensen.model.SumoDAO#updateCoach(com.jensen.model.Coach)
	 */
	@Override
	public void updateCoach(Coach coachObject) {
		try {
			// 1. connect to the database
			connection = dataSource.getConnection();
			
			// 2. prepare statement
			preparedStatement = connection.prepareStatement("UPDATE sumo.coach SET name=?, birthdate=?,"
					+ "highest_rank=?, competitive_matches=?, competitive_wins=?,"
					+ "competitive_losses=?, retired_from_competing=?, club_id=? WHERE id=?");
			
			// 3. set parameters
			preparedStatement.setString(1, coachObject.getName());
			preparedStatement.setString(2, coachObject.getBirthdate());	//String to Date
			preparedStatement.setString(3, coachObject.getHighestRank());
			preparedStatement.setInt(4, coachObject.getCompetitiveMatches());
			preparedStatement.setInt(5, coachObject.getCompetitiveWins());
			preparedStatement.setInt(6, coachObject.getCompetitiveLosses());
			preparedStatement.setString(7, coachObject.getRetiredFromCompeting());
			preparedStatement.setInt(8, coachObject.getClubId());
			preparedStatement.setInt(9, coachObject.getId());
			
			// 4. execute statement
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			// close all resources
			close(connection, preparedStatement, null);
		}
	}

	/*
	 * (non-Javadoc)
	 * @see com.jensen.model.SumoDAO#deleteCoach(com.jensen.model.Coach)
	 */
	@Override
	public void deleteCoach(Coach coachObject) {
		try {
			// 1. connect to the database
			connection = dataSource.getConnection();
			
			// 2. prepare statement
			preparedStatement = connection.prepareStatement("DELETE FROM sumo.coach WHERE id=?");
			
			// 3. set parameter
			preparedStatement.setInt(1, coachObject.getId());
			
			// 4. execute statement
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			// close all resources
			close(connection, preparedStatement, null);
		}
	}

	/*
	 * (non-Javadoc)
	 * @see com.jensen.model.SumoDAO#searchCoach(java.lang.String)
	 */
	@Override
	public LinkedList<Coach> searchCoach(String name) {
		name = "%" + name + "%";
		LinkedList<Coach> tempCoachList = new LinkedList<>();
		try {
			// 1. connect to the database
			connection = dataSource.getConnection();
			
			// 2. prepare statement
			preparedStatement = connection.prepareStatement("SELECT * FROM sumo.coach_join_club WHERE name LIKE ? ORDER BY name");
			
			// 3. set parameter
			preparedStatement.setString(1, name);
			
			// 4. execute statement
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				tempCoachList.add(convertRowToCoachObject(resultSet));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			// close all resources
			close(connection, preparedStatement, resultSet);
		}
		this.coachList = tempCoachList;
		return this.coachList;
	}
	//Coach methods ends ------------------------------------------------------------------------------------

	//Player methods
	private Player convertRowToPlayerObject(ResultSet resultSet) {
		Player player = new Player();
		try {
			player.setId(resultSet.getInt("id"));
			player.setName(resultSet.getString("name"));
			player.setHeightCm(resultSet.getInt("height_cm"));
			player.setWeightKg(resultSet.getInt("weight_kg"));
			player.setBirthdate(resultSet.getString("birthdate"));
			player.setNativeCity(resultSet.getString("native_city"));
			player.setRank(resultSet.getString("rank"));
			player.setCoachId(resultSet.getInt("coach_id"));
			player.setClubId(resultSet.getInt("club_id"));
			player.setCoachName(resultSet.getString("coach_name"));
			player.setClubName(resultSet.getString("club_name"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return player;
	}
	
	@Override
	public Player getSinglePlayer(int id) { //--------------------------------------------
		Player thePlayer = null;
		try {
			// 1. connect to the database
			connection = dataSource.getConnection();
			
			// 2. create statement
			String sql = "SELECT * FROM sumo.player_join_coach_and_club WHERE id=?";
			preparedStatement = connection.prepareStatement(sql);
			
			// 3. set parameters
			preparedStatement.setInt(1, id);
			
			// 4. get the result
			resultSet = preparedStatement.executeQuery();
			
			// 5. process the result
			while(resultSet.next()) {
				thePlayer = convertRowToPlayerObject(resultSet);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			// close all resources
			close(connection, preparedStatement, resultSet);
		}
		return thePlayer;
	}

	/*
	 * (non-Javadoc)
	 * @see com.jensen.model.SumoDAO#createPlayer(com.jensen.model.Player)
	 */
	@Override
	public void createPlayer(Player playerObject) {
		try {
			// 1. connect to the database
			connection = dataSource.getConnection();
			
			// 2. prepare statement
			preparedStatement = connection.prepareStatement("INSERT INTO player (name, height_cm, weight_kg,"
					+ "birthdate, native_city, rank, coach_id, club_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
			
			// 3. set parameters
			preparedStatement.setString(1, playerObject.getName());
			preparedStatement.setInt(2, playerObject.getHeightCm());
			preparedStatement.setInt(3, playerObject.getWeightKg());
			preparedStatement.setString(4, playerObject.getBirthdate());
			preparedStatement.setString(5, playerObject.getNativeCity());
			preparedStatement.setString(6, playerObject.getRank());
			preparedStatement.setInt(7, playerObject.getCoachId());
			preparedStatement.setInt(8, playerObject.getClubId());
			
			// 4. execute statement
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			// close all resources
			close(connection, preparedStatement, resultSet);
		}
	}

	/*
	 * (non-Javadoc)
	 * @see com.jensen.model.SumoDAO#readAllPlayers()
	 */
	@Override
	public LinkedList<Player> readAllPlayers() {
		this.playerList = new LinkedList<Player>(); 
		try {
			// 1. connect to the database
			connection = dataSource.getConnection();
			
			// 2. create a statement
			String sql = "SELECT * FROM sumo.player_join_coach_and_club ORDER BY name";
			preparedStatement = connection.prepareStatement(sql);
			
			// 3. execute the statement
			resultSet = preparedStatement.executeQuery();
			
			// 4. process the result
			while(resultSet.next()) {
				playerList.add(convertRowToPlayerObject(this.resultSet));
			}
			return playerList;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			// close all resources
			close(connection, preparedStatement, resultSet);
		}
		return playerList;
	}

	/*
	 * (non-Javadoc)
	 * @see com.jensen.model.SumoDAO#updatePlayer(com.jensen.model.Player)
	 */
	@Override
	public void updatePlayer(Player playerOject) {
		try {
			// 1. connect to the database
			connection = dataSource.getConnection();
			
			// 2. prepare statement
			preparedStatement = connection.prepareStatement("UPDATE sumo.player SET name=?, height_cm=?, weight_kg=?,"
					+ "birthdate=?, native_city=?, rank=?, coach_id=?, club_id=? WHERE id=?");
			
			// 3. set parameters
			preparedStatement.setString(1, playerOject.getName());
			preparedStatement.setInt(2, playerOject.getHeightCm());
			preparedStatement.setInt(3, playerOject.getWeightKg());
			preparedStatement.setString(4, playerOject.getBirthdate());
			preparedStatement.setString(5, playerOject.getNativeCity());
			preparedStatement.setString(6, playerOject.getRank());
			preparedStatement.setInt(7, playerOject.getCoachId());
			preparedStatement.setInt(8, playerOject.getClubId());
			preparedStatement.setInt(9, playerOject.getId());
			
			// 4. execute statement
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			// close all resources
			close(connection, preparedStatement, resultSet);
		}
	}

	/*
	 * (non-Javadoc)
	 * @see com.jensen.model.SumoDAO#deletePlayer(com.jensen.model.Player)
	 */
	@Override
	public void deletePlayer(Player playerObject) {
		try {
			// 1. connect to the database
			connection = dataSource.getConnection();
			
			// 2. prepare statement
			preparedStatement = connection.prepareStatement("DELETE FROM player WHERE id=?");
			
			// 3. set parameter
			preparedStatement.setInt(1, playerObject.getId());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			// close all resources
			close(connection, preparedStatement, resultSet);
		}
	}

	/*
	 * (non-Javadoc)
	 * @see com.jensen.model.SumoDAO#searchPlayer(java.lang.String)
	 */
	@Override
	public LinkedList<Player> searchPlayer(String name) {
		name = "%" + name + "%";
		LinkedList<Player> tempPlayerList = new LinkedList<>();
		try {
			// 1. connect to the database
			connection = dataSource.getConnection();
			
			// 2. prepare statement
			preparedStatement = connection.prepareStatement("SELECT * FROM sumo.player_join_coach_and_club WHERE name LIKE ? ORDER BY name");
			preparedStatement.setString(1, name);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				tempPlayerList.add(convertRowToPlayerObject(resultSet));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			// close all resources
			close(connection, preparedStatement, resultSet);
		}
		this.playerList = tempPlayerList;
		return playerList;
	}
	//Player methods ends ------------------------------------------------------------------------------------

	/**
	 * Closes all the resources used, Connection, PreparedStatement and ResultSet objects.
	 * @param connection2 a Connection object.
	 * @param preparedStatement2 a PreparedStatement object.
	 * @param resultSet2 a ResultSet object.
	 * @see Connection
	 * @see PreparedStatement
	 * @see ResultSet
	 */
	private void close(Connection connection2, PreparedStatement preparedStatement2, ResultSet resultSet2) {
		try {
			if(connection != null)
				connection.close();
			
			if(preparedStatement != null)
				preparedStatement.close();
			
			if(resultSet != null)
				resultSet.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
