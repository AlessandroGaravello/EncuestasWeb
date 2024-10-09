package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import encuestas.Encuesta;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

@WebServlet("/NuevaEncuesta")
public class NuevaEncuesta extends HttpServlet {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recoger datos del formulario
        String sonidoStr = request.getParameter("sonido");
        String imagenStr = request.getParameter("imagen");
        String facilidadUsoStr = request.getParameter("facilidadUso");

        // Asegurarse de que los datos se han recibido correctamente
        if (sonidoStr != null && imagenStr != null && facilidadUsoStr != null) {
            try {
                int sonido = Integer.parseInt(sonidoStr);
                int imagen = Integer.parseInt(imagenStr);
                int facilidadUso = Integer.parseInt(facilidadUsoStr);

                // Crear una nueva encuesta
                Encuesta nuevaEncuesta = new Encuesta(sonido, imagen, facilidadUso);

                // Obtener la lista de encuestas del contexto de aplicación
                List<Encuesta> encuestas = (List<Encuesta>) getServletContext().getAttribute("encuestas");

                // Si la lista no está inicializada, inicializarla
                if (encuestas == null) {
                    encuestas = new ArrayList<>();
                    getServletContext().setAttribute("encuestas", encuestas);
                }

                // Añadir la nueva encuesta a la lista
                encuestas.add(nuevaEncuesta);

                // Redirigir al servlet GestorEncuestas para mostrar la página de encuestas
                response.sendRedirect("GestorEncuestas");
            } catch (NumberFormatException e) {
                // Manejar errores en caso de que no se puedan convertir los números
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } else {
            // Si los datos no se han recibido correctamente
            response.sendRedirect("error.jsp");
        }
        
    }
}
