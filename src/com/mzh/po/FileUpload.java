package com.mzh.po;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
private String id;
private String fileName;
private String filePath;
private MultipartFile csvFile;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getFileName() {
	return fileName;
}
public void setFileName(String fileName) {
	this.fileName = fileName;
}
public String getFilePath() {
	return filePath;
}
public void setFilePath(String filePath) {
	this.filePath = filePath;
}
public MultipartFile getCsvFile() {
	return csvFile;
}
public void setCsvFile(MultipartFile csvFile) {
	this.csvFile = csvFile;
}

}