package get_html;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestGetHtml
 */
@WebServlet("/TestGetHtml")
public class TestGetHtml extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public TestGetHtml() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 System.out.println("doGet...");
	        //设置编码
		 req.setCharacterEncoding("utf-8");
		 req.setCharacterEncoding("utf-8");
		 resp.setContentType("text/html");
//		String name = req.getParameter("name");
//    	PrintWriter out = resp.getWriter();
//    	out.println("include1");
//		if(name!=null&&name.equals("rose")) {
			//请求包含   包含success页面
//			req.getRequestDispatcher("/2_basic/Success.html").include(req, resp);
//		}else {
			req.getRequestDispatcher("/index.jsp").include(req, resp);
//		}
    	System.out.println("doGet1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
