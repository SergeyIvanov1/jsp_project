package com.ivanovsergey.jsp_project.servlets;

import com.ivanovsergey.cryptoanalyser.TextProcessing.Coder;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
//import com.oreilly.servlet.MultipartRequest;
//https://progler.ru/blog/servlet-zagruzka-fayla

@WebServlet("/encrypt")
@MultipartConfig
public class EncryptServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("/views/encryptor.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out = resp.getWriter();
        StringBuilder stringBuilder = new StringBuilder();

        int key = Integer.parseInt(req.getParameter("key"));

        Coder.encryption(req, stringBuilder, key);


//        MultipartRequest m = new MultipartRequest(request, "C:\temp");

//        out.print("File uploaded successfully");

        String string = stringBuilder.toString();
        out.write(string + " hello");

    }
}
