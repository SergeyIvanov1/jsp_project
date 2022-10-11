package com.ivanovsergey.jsp_project.servlets;

import com.ivanovsergey.cryptoanalyser.Exceptions.PathProcessingException;
import com.ivanovsergey.cryptoanalyser.Exceptions.ReadWrightFileException;
import com.ivanovsergey.cryptoanalyser.TextProcessing.Coder;
import com.ivanovsergey.cryptoanalyser.TextProcessing.Decoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;

@WebServlet("/manual_decryption_brute_force")
@MultipartConfig
public class ManualDecryptionBruteForceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(resp.encodeRedirectURL("/views/manual_decryption_brute_force.jsp"));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out = resp.getWriter();
        StringBuilder stringBuilder = new StringBuilder();

        Decoder.manualDecryptionBruteForce(req, stringBuilder);

        String string = stringBuilder.toString();
        out.write(string + " hello");

    }
}
