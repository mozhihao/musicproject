package com.mzh.util;  

import java.io.IOException;  
import java.io.PrintWriter;  

import javax.servlet.FilterChain;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

import org.springframework.web.filter.OncePerRequestFilter;  

/** 
 * 前台登录过滤 
 *  
 */  
public class bgSessionFilter extends OncePerRequestFilter {  

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

        // 不过滤的uri  
        String[] notFilter = new String[] { "bglogin","css","/images", "/js", "/css","/fonts","/upload" ,"/bgLoginaction","/upmusicsuccess"};  

        // 请求的uri  
        String uri = request.getRequestURI();  

        // uri中包含music2时才进行过滤  
        if (uri.indexOf("music2/bg") != -1) {  //==符号是为关闭 ！=为开启
            // 是否过滤  
            boolean doFilter = true;  
            for (String s : notFilter) {  
                if (uri.indexOf(s) != -1) {  
                    // 如果uri中包含不过滤的uri，则不进行过滤  
                    doFilter = false;  
                    break;  
                }  
            }  
            if (doFilter) {  
                // 执行过滤  
                // 从session中获取登录者实体  
//                Object obj = request.getSession().getAttribute("u");
                Object obj = request.getSession().getAttribute("r");
                if (null == obj) {  
                    // 如果session中不存在登录者实体，则弹出框提示重新登录  
                    // 设置request和response的字符集，防止乱码  
                    request.setCharacterEncoding("GBk");  
                    response.setCharacterEncoding("GBK");  
                    PrintWriter out = response.getWriter();  
                    String loginPage;  
                    System.out.println(uri+"!!!!!!");
                    loginPage  = "bglogin";
                    StringBuilder builder = new StringBuilder();  
                    builder.append("<script type=\"text/javascript\">");  
                    builder.append("alert('请先登录！');");  
                    builder.append("window.top.location.href='");  
                    builder.append(loginPage);  
                    builder.append("';");  
                    builder.append("</script>");  
                    out.print(builder.toString());  
                } 
                else {  
                    // 如果session中存在登录者实体，则继续  
                    filterChain.doFilter(request, response);  
                }  
            } else {  
                // 如果不执行过滤，则继续  
                filterChain.doFilter(request, response);  
            }  
        } else {  
            // 如果uri中不包含background，则继续  
            filterChain.doFilter(request, response);  
        }  
    }  
}  