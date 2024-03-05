package funfit.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import funfit.connections.DbConnection;
import funfit.models.Participant;

public class ParticipantDao {
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	public ParticipantDao() {
		this.conn = DbConnection.getConnection();
//		System.out.println(this.conn);
	}

//	add participant
	public boolean addParticipant(Participant participant) throws SQLException {
		int res = 0;
		try {
			ps = this.conn.prepareStatement("Insert into participant values(?, ?, ?, ?, ?)");
			ps.setInt(1, participant.getpId());
			ps.setString(2, participant.getpName());
			ps.setInt(3, participant.getpAge());
			ps.setString(4, participant.getpEmail());
			ps.setString(5, participant.getPassword());

			res = ps.executeUpdate();
		} catch (Exception e) {
			conn.close();
			ps.close();
			System.out.println(e);
		}
		if (res >= 1) {
			return true;
		}
		return false;
	}

//	search participant
	public Participant searchParticipant(int pId) throws SQLException {
		Participant person = null;
		try {
			ps = this.conn.prepareStatement("select * from participant where pId = ?");
			ps.setInt(1, pId);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				person = ParticipantDao.returnParticipant(rs);
			}

		} catch (Exception e) {
			conn.close();
			ps.close();
			System.out.println(e);
		}
		return person;
	}

//	all participants
	public List<Participant> allParticipants() throws SQLException {
		List<Participant> all = new ArrayList<>();
		try {
			ps = this.conn.prepareStatement("select * from participant");

			ResultSet rs = ps.executeQuery();

			Participant person = null;
			while (rs.next()) {
				person = ParticipantDao.returnParticipant(rs);
				all.add(person);
			}
			
		} catch (Exception e) {
			conn.close();
			ps.close();
			System.out.println(e);
		}
		return all;
	}

// delete a participant
	public boolean deleteParticipant(int pId) {
		try {
			this.ps = this.conn.prepareStatement("delete from participant where pId = ?");
			this.ps.setInt(1, pId);
			
			if(this.ps.executeUpdate() == 1) {
				return true;
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return false;
	}
	
//	function to check the user login credentials
	public Participant checkUserCredentials(String email, String password) {
		try {
			this.ps = this.conn.prepareStatement("select * from participant where pEmail = ? and password = ?");
			this.ps.setString(1, email);
			this.ps.setString(2, password);
			
			ResultSet rs = this.ps.executeQuery();
			if(rs.next()) {
				return ParticipantDao.returnParticipant(rs);
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
//This method just takes a result set and returns a participant object from it
	public static Participant returnParticipant(ResultSet rs) throws SQLException {
		Participant person = null;

		person = new Participant();
		person.setpId(rs.getInt("pId"));
		person.setpName(rs.getString("pName"));
		person.setpAge(rs.getInt("pAge"));
		person.setpEmail(rs.getString("pEmail"));
		person.setPassword(rs.getString("password"));

		return person;
	}
}