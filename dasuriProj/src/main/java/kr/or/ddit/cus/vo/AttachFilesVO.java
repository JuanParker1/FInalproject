package kr.or.ddit.cus.vo;

import org.springframework.format.annotation.DateTimeFormat;

public class AttachFilesVO {

	private String id;
	private int seq;
	private String uploadFileName;
	private String uploadFileSize;
	@DateTimeFormat(pattern= "yyyy-MM-dd")
	private String registDt;
	private String registerId;
	@DateTimeFormat(pattern= "yyyy-MM-dd")
	private String updateDt;
	private String updaterId;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getUploadFileSize() {
		return uploadFileSize;
	}
	public void setUploadFileSize(String uploadFileSize) {
		this.uploadFileSize = uploadFileSize;
	}
	public String getRegistDt() {
		return registDt;
	}
	public void setRegistDt(String registDt) {
		this.registDt = registDt;
	}
	public String getRegisterId() {
		return registerId;
	}
	public void setRegisterId(String registerId) {
		this.registerId = registerId;
	}
	public String getUpdateDt() {
		return updateDt;
	}
	public void setUpdateDt(String updateDt) {
		this.updateDt = updateDt;
	}
	public String getUpdaterId() {
		return updaterId;
	}
	public void setUpdaterId(String updaterId) {
		this.updaterId = updaterId;
	}
	@Override
	public String toString() {
		return "AttachFilesVO [id=" + id + ", seq=" + seq + ", uploadFileName=" + uploadFileName + ", uploadFileSize="
				+ uploadFileSize + ", registDt=" + registDt + ", registerId=" + registerId + ", updateDt=" + updateDt
				+ ", updaterId=" + updaterId + "]";
	}

	
}
