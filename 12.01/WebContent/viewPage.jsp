<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java"
	import="com.oreilly.servlet.MultipartRequest, oracle.sql.*, javax.servlet.http.*,java.io.*, java.sql.*, java.text.*, java.util.*"%>
	<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
	//Initialization & upload, 10 메가
String new_Tconst = (String) request.getSession().getAttribute("new_Tconst");
int img_name = Integer.parseInt(new_Tconst.substring(2));
String save_file_name = Integer.toString(img_name) + ".jpg";

String savePath = "C:/Users/admin/eclipse-workspace/Phase4/WebContent/movie_img"; //path

int sizeLimit = 1 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(request,savePath,sizeLimit,"UTF-8",new DefaultFileRenamePolicy());
//MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8");
//MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit,"euc-kr", new DefaultFileRenamePolicy());
//MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());   //업로드


String oldmask = multi.getParameter("maskname");
String timemask = "" + System.currentTimeMillis();

System.out.print("timemask=" + timemask);

Enumeration files = multi.getFileNames();

String fname = (String) files.nextElement();
String fileName = multi.getFilesystemName(fname);
String id = multi.getParameter("id");

System.out.print("id=" + id);
String newFileName = save_file_name;
if (fileName != null) {
	File upfile1 = new File(savePath + "/" + fileName); //--'/'를빼고 작업했다 .그래서 경로가 제대로 나오지 않음
	//File upfile2 = new File(savePath + "/" + timemask + fileName.substring(fileName.lastIndexOf(".")));
	if (upfile1.renameTo(upfile1)) {
		out.print("이름변경성공");
	} else {
		out.print("이름변경실패");
	}
	System.out.print("업로드 된 파일명=" + savePath + "/" + upfile1.getName());
	newFileName = upfile1.getName();
}
System.out.println("img upload success");

response.sendRedirect("index.jsp");
%>

