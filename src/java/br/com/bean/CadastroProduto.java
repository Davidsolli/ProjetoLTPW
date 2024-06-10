/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.bean;

import br.com.controle.Loja;
import br.com.controle.Produto;
import br.com.entidade.DAOProduto;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author HypeH
 */
@WebServlet(name = "CadastroProduto", urlPatterns = {"/CadastroProduto"})
public class CadastroProduto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String nomeProduto = request.getParameter("nome-produto");
            String descricaoProduto = request.getParameter("descricao-produto");
            double valorProduto = Double.parseDouble(request.getParameter("valor-produto"));
            int lojaId = Integer.parseInt(request.getParameter("loja-id"));
            
            Loja loja = new Loja();
            loja.setId(lojaId);

            Produto produto = new Produto(nomeProduto, descricaoProduto, valorProduto);

            DAOProduto produtoDao = new DAOProduto();
            produto.setLoja(loja);

            try {
                produtoDao.inserirLoja(produto);
                out.println("Produto cadastrado com sucesso!");
            } catch (Exception e) {
                out.println("Erro ao cadastrar produto: " + e.getMessage());
            }

            RequestDispatcher rd = request.getRequestDispatcher("lista-loja.jsp");
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
