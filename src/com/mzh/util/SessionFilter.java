package com.mzh.util;  

import java.io.IOException;  
import java.io.PrintWriter;  

import javax.servlet.FilterChain;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

import org.springframework.web.filter.OncePerRequestFilter;  

/** 
 * ǰ̨��¼���� 
 *  
 */  
public class SessionFilter extends OncePerRequestFilter {  

    /* 
     *  
     * org.springframework.web.filter.OncePerRequestFilter#doFilterInternal( 
     * javax.servlet.http.HttpServletRequest, 
     * javax.servlet.http.HttpServletResponse, javax.servlet.FilterChain) 
     */  
    @Override  
    protected void doFilterInternal(HttpServletRequest request,  
            HttpServletResponse response, FilterChain filterChain)  
            throws ServletException, IOException {  

        // �����˵�uri  
        String[] notFilter = new String[] { "login","/music2/creditcard","outCreditcardLogin","creditcardinfo","creditcardindex","creditcardloginaction","reg", "News","musictype","ranking","music2/bg","/index","/images", "/js", "/css","/fonts","/upload" };  

        // �����uri  
        String uri = request.getRequestURI();  

        // uri�а���music2ʱ�Ž��й���  
        if (uri.indexOf("music2") != -1) {  //==������Ϊ�ر� ��=Ϊ����
            // �Ƿ����  
            boolean doFilter = true;  
            for (String s : notFilter) {  
                if (uri.indexOf(s) != -1) {  
                    // ���uri�а��������˵�uri���򲻽��й���  
                    doFilter = false;  
                    break;  
                }  
            }  
            if (doFilter) {  
                // ִ�й���  
                // ��session�л�ȡ��¼��ʵ��  
                Object obj = request.getSession().getAttribute("u");
                Object obj2 = request.getSession().getAttribute("r");
                if (null == obj) {  
                    // ���session�в����ڵ�¼��ʵ�壬�򵯳�����ʾ���µ�¼  
                    // ����request��response���ַ�������ֹ����  
                    request.setCharacterEncoding("GBk");  
                    response.setCharacterEncoding("GBK");  
                    PrintWriter out = response.getWriter();  
                    String loginPage;  
                    System.out.println(uri+"!!!!!!");
//                    if(uri.indexOf("music2/bg")!=-1){
//                    	loginPage = "index";
//                    }else
                    	loginPage  = "login";
                    StringBuilder builder = new StringBuilder();  
                    builder.append("<script type=\"text/javascript\">");  
                    builder.append("alert('���ȵ�¼��');");  
                    builder.append("window.top.location.href='");  
                    builder.append(loginPage);  
                    builder.append("';");  
                    builder.append("</script>");  
                    out.print(builder.toString());  
                } 
                else {  
                    // ���session�д��ڵ�¼��ʵ�壬�����  
                    filterChain.doFilter(request, response);  
                }  
            } else {  
                // �����ִ�й��ˣ������  
                filterChain.doFilter(request, response);  
            }  
        } else {  
            // ���uri�в�����background�������  
            filterChain.doFilter(request, response);  
        }  
    }  
}  