package filter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FirstFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		  HttpServletRequest request = (HttpServletRequest) req;
		  HttpServletResponse response = (HttpServletResponse) resp;
		  response.setCharacterEncoding("UTF-8");
		//  PrintWriter out = response.getWriter();
		  
		  if(request.getRequestURI().indexOf("main")!= -1)
		  {
			  chain.doFilter(request, response);
			  return;
		  }
		  
		  HttpSession  session = request.getSession();
		  if(session.getAttribute("username")==null)
		  {   
			  String uri = request.getRequestURI();
			  session.setAttribute("uri", uri);
			  response.sendRedirect("main.jsp");
		  }else{
			  chain.doFilter(req, resp);
		  }
//          out.println("filter start working!");          
//          chain.doFilter(req, resp);
//          out.println("filter stop working!");
	}

	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub

	}

}
