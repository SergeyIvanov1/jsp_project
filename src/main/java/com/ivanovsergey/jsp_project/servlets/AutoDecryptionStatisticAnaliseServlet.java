package com.ivanovsergey.jsp_project.servlets;

import com.ivanovsergey.cryptoanalyser.TextProcessing.Coder;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

@WebServlet("/auto_decryption_statistic_analise")
@MultipartConfig
public class AutoDecryptionStatisticAnaliseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("/views/auto_decryption_statistic_analise.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Part filePart = req.getPart("file");
        try (InputStream inputStream = filePart.getInputStream()) {

            PrintWriter out = resp.getWriter();
            StringBuilder stringBuilder = new StringBuilder();

            int key = Integer.parseInt(req.getParameter("key"));

            Coder.encryption(inputStream, stringBuilder, key);

            String string = stringBuilder.toString();
            out.write(string + " hello");
        }
    }
}
