package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import encuestas.Encuesta;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/GestorEncuestas")
public class GestorEncuestas extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    public void init() throws ServletException {
        // Inicializa la lista de encuestas en el contexto de la aplicación
        List<Encuesta> encuestas = new ArrayList<>();
        getServletContext().setAttribute("encuestas", encuestas);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Delegar la petición en la vista encuestas.jsp
        request.getRequestDispatcher("/encuestas.jsp").forward(request, response);
    }
}
