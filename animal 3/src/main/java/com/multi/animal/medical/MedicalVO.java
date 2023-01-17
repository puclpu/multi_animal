package com.multi.animal.medical;

public class MedicalVO {
	private int medicalId;
	private String medicalName;
	private String lAddr;
	private String rAddr;
	private String pCode;
	private String medicalTel;
	private String medicalLocation;
	
	public String getMedicalLocation() {
		return medicalLocation;
	}
	public void setMedicalLocation(String medicalLocation) {
		this.medicalLocation = medicalLocation;
	}
	public int getMedicalId() {
		return medicalId;
	}
	public void setMedicalId(int medicalId) {
		this.medicalId = medicalId;
	}
	public String getMedicalName() {
		return medicalName;
	}
	public void setMedicalName(String medicalName) {
		this.medicalName = medicalName;
	}
	public String getlAddr() {
		return lAddr;
	}
	public void setlAddr(String lAddr) {
		this.lAddr = lAddr;
	}
	public String getrAddr() {
		return rAddr;
	}
	public void setrAddr(String rAddr) {
		this.rAddr = rAddr;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getMedicalTel() {
		return medicalTel;
	}
	public void setMedicalTel(String medicalTel) {
		this.medicalTel = medicalTel;
	}
	
}
