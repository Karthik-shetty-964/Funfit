package funfit.models;

import java.sql.Timestamp;

public class Batch {
	private int batchId;
	private String batchName;
	private String batchSchedule;
	private Timestamp dateTime;
	private String trainerName;
	
	public int getBatchId() {
		return batchId;
	}

	public void setBatchId(int batchId) {
		this.batchId = batchId;
	}

	public String getBatchName() {
		return batchName;
	}

	public void setBatchName(String batchName) {
		this.batchName = batchName;
	}

	public String getBatchSchedule() {
		return batchSchedule;
	}

	public void setBatchSchedule(String batchSchedule) {
		this.batchSchedule = batchSchedule;
	}

	public String getTrainerName() {
		return trainerName;
	}

	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}

	public Timestamp getDateTime() {
		return dateTime;
	}

	public void setDateTime(Timestamp datetime) {
		this.dateTime = datetime;
	}
	
	
}
