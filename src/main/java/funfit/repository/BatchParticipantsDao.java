package funfit.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import funfit.connections.DbConnection;
import funfit.models.Batch;
import funfit.models.Participant;

public class BatchParticipantsDao {
	private Connection conn = null;
	private PreparedStatement ps = null;

	public BatchParticipantsDao() {
		this.conn = DbConnection.getConnection();
	}

//	Method to add a participant to a batch
	public boolean addParticipantToBatch(int pId, int batchId) throws SQLException {
		int res = 0;
		try {
			ps = this.conn.prepareStatement("Insert into batchParticipants (pId, batchId) values(?, ?)");
			ps.setInt(1, pId);
			ps.setInt(2, batchId);

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

//	Method to fetch all the participants of a particular batch
	public List<Participant> allParticipantsOfBatch(int batchId) throws SQLException {
		List<Participant> allParticipants = new ArrayList<>();

		try {
			ps = this.conn.prepareStatement(
					"select p.pId, p.pName, p.pAge, p.pEmail, password from participant p, batchParticipants where p.pId = batchParticipants.pId and batchParticipants.batchId = ?");
			ps.setInt(1, batchId);

			ResultSet rs = ps.executeQuery();

			Participant person = null;
			while (rs.next()) {
				person = ParticipantDao.returnParticipant(rs);
				allParticipants.add(person);
			}

		} catch (Exception e) {
			conn.close();
			ps.close();
			System.out.println(e);
		}
		return allParticipants;
	}

//	Method to fetch all the batches of a particular participant
	public List<Batch> allBatchesOfParticipant(int pId) throws SQLException {
		List<Batch> allBatches = new ArrayList<>();

		try {
			ps = this.conn.prepareStatement(
					"select b.batchId, b.batchName, b.batchSchedule, b.dateTime, b.trainerName from batch b, batchParticipants where b.batchId = batchParticipants.batchId and batchParticipants.pId = ?");
			ps.setInt(1, pId);

			ResultSet rs = ps.executeQuery();

			Batch batch = null;
			while (rs.next()) {
				batch = BatchDao.returnBatch(rs);
				allBatches.add(batch);
			}

		} catch (Exception e) {
			conn.close();
			ps.close();
			System.out.println(e);
		}
		return allBatches;
	}

//	Method to fetch all the participants who are not in a particular batch
	public List<Participant> allParticipantsNotOfBatch(int batchId) throws SQLException {
		List<Participant> allParticipants = new ArrayList<>();

		try {
			ps = this.conn.prepareStatement(
					"select * from participant where pId not in (select p.pId from participant p, batchParticipants where batchParticipants.pId = p.pId and batchParticipants.batchId = ?)");
			ps.setInt(1, batchId);

			ResultSet rs = ps.executeQuery();

			Participant person = null;
			while (rs.next()) {
				person = ParticipantDao.returnParticipant(rs);
				allParticipants.add(person);
			}

		} catch (Exception e) {
			conn.close();
			ps.close();
			System.out.println(e);
		}
		return allParticipants;
	}

//	Method to remove a participant from a batch
	public boolean removeParticipantFromBatch(int pId, int batchId) {
		try {
			ps = this.conn.prepareStatement("delete from batchParticipants where pId=? and batchId=?");
			ps.setInt(1, pId);
			ps.setInt(2, batchId);

			if (this.ps.executeUpdate() == 1) {
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return false;
	}
}
