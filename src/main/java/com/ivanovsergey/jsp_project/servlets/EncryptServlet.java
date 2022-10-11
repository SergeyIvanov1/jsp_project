package com.ivanovsergey.jsp_project.servlets;

import com.ivanovsergey.cryptoanalyser.TextProcessing.Coder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
//import com.oreilly.servlet.MultipartRequest;
//https://progler.ru/blog/servlet-zagruzka-fayla

@WebServlet("/encrypt")
@MultipartConfig
public class EncryptServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("getForm", "encrypt_form");
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/views/cryptanalyzer.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        StringBuilder stringBuilder = new StringBuilder();

        int key = Integer.parseInt(req.getParameter("key"));

        Coder.encryption(req, stringBuilder, key);


//        MultipartRequest m = new MultipartRequest(request, "C:\temp");

//        out.print("File uploaded successfully");


        String string = stringBuilder.toString();

        req.setAttribute("encrypt", string);
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/views/cryptanalyzer.jsp");
        requestDispatcher.forward(req, resp);
    }
}
