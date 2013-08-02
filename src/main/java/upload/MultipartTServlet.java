package upload;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

import Test.DOMAnalysisXml;

public class MultipartTServlet extends HttpServlet {
	public MultipartTServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			   throws ServletException, IOException {
		String worker=null;
	
		String path=null;
//			String worker=request.getParameter("worker");
//			String t=request.getParameter("time");
//			System.out.println(worker+"人");
//			System.out.println(t+"时间");
//			SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd");
//			Date d1 = null;
//			try {
//				d1 = f.parse(t);
//			} catch (ParseException e2) {
//				// TODO Auto-generated catch block
//				e2.printStackTrace();
//			}
			request.setCharacterEncoding("UTF-8");
			
			RequestContext requestContext = new ServletRequestContext(request);
		
			if(FileUpload.isMultipartContent(requestContext)){

			   DiskFileItemFactory factory = new DiskFileItemFactory();
			
			   factory.setRepository(new File("d:/tmp/"));
			   ServletFileUpload upload = new ServletFileUpload(factory);
			 
			   upload.setSizeMax(100*1024*1024);
			   List items = new ArrayList();
			    try {
			      
			     items = upload.parseRequest(request);
			    } catch (FileUploadException e1) {
			     System.out.println("error" + e1.getMessage());
			    }
			    
			   Iterator it = items.iterator();
			   while(it.hasNext()){
			    FileItem fileItem = (FileItem) it.next();
			    
			    if(fileItem.isFormField()){  
			     System.out.println(fileItem.getFieldName() + " hh  " + fileItem.getName() + "   " + new String(fileItem.getString().getBytes("iso8859-1"), "UTF-8"));
			     worker=new String(fileItem.getString().getBytes("iso8859-1"), "UTF-8");
			    }else{
			     System.out.println(fileItem.getFieldName() + " ss  " +
			        fileItem.getName() + "   " +
			        fileItem.isInMemory() + "    " +
			        fileItem.getContentType() + "   " +
			        fileItem.getSize());
			 
			     if(fileItem.getName()!=null && fileItem.getSize()!=0){
			      File fullFile = new File(fileItem.getName());
			      File newFile = new File("d:/temp/" + fullFile.getName());
			    //以上是上传的文件
			     
					path="d:/temp/"+fullFile.getName();
			      try {
			       fileItem.write(newFile);
			      } catch (Exception e) {
			       e.printStackTrace();
			      }
			     }else{
			      System.out.println("文件没有选择 或 文件内容为空");
			     }
			    }

			   }
			}
			 DOMAnalysisXml d=new DOMAnalysisXml();
		      d.analysisXml(path);
			
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
	
}
