package funfit.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import funfit.connections.DbConnection;
import funfit.models.Batch;

public class BatchDao {
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	public BatchDao() {
		this.conn = DbConnection.getConnection();
	}

//	add batch
	public boolean addBatch(Batch batch) throws SQLException {
		int res = 0;
		try {
			ps = this.conn.prepareStatement("Insert into batch values(?, ?, ?, ?, ?)");
			ps.setInt(1, batch.getBatchId());
			ps.setString(2, batch.getBatchName());
			ps.setString(3, batch.getBatchSchedule());
			ps.setTimestamp(4, batch.getDateTime());
			ps.setString(5, batch.getTrainerName());

			res = ps.executeUpdate();
		} catch (Exception e) {
			conn.close();
			ps.close();
			System.out.println(e);
		}
		if (res >= 0) {
			return true;
		}
		return false;
	}

//	search batch
	public Batch searchBatch(int batchId) throws SQLException {
		Batch batch = null;
		try {
			ps = this.conn.prepareStatement("select * from batch where batchId = ?");
			ps.setInt(1, batchId);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				batch = BatchDao.returnBatch(rs);
			}

		} catch (Exception e) {
			conn.close();
			ps.close();
			System.out.println(e);
		}
		return batch;
	}

//	all batches
	public List<Batch> allBatches() throws SQLException {
		List<Batch> all = new ArrayList<>();
		try {
			ps = this.conn.prepareStatement("select * from batch");

			ResultSet rs = ps.executeQuery();

			Batch batch = null;
			while (rs.next()) {
				batch = BatchDao.returnBatch(rs);
				all.add(batch);
			}

		} catch (Exception e) {
			conn.close();
			ps.close();
			System.out.println(e);
		}
		return all;
	}

// delete a batch
	public boolean deleteBatch(int batchId) {
		try {
			this.ps = this.conn.prepareStatement("delete from batch where batchId = ?");
			this.ps.setInt(1, batchId);

			if (this.ps.executeUpdate() == 1) {
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return false;
	}

//This method just takes a result set and returns a batch object from it
	public static Batch returnBatch(ResultSet rs) throws SQLException {
		Batch batch = new Batch();
		
		batch.setBatchId(rs.getInt("batchId"));
		batch.setBatchName(rs.getString("batchName"));
		batch.setBatchSchedule(rs.getString("batchSchedule"));
		batch.setDateTime(rs.getTimestamp("dateTime"));
		batch.setTrainerName(rs.getString("trainerName"));
		
		return batch;
	}
}