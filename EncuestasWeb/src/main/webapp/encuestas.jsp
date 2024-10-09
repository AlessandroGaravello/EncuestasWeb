<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="encuestas.Encuesta, java.util.List" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Encuestas</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-center mb-4">Encuestas sobre Televisores</h2>

        <!-- Formulario para añadir nueva encuesta -->
        <form action="NuevaEncuesta" method="post" class="mb-4">
            <div class="form-group">
                <label for="sonido">Calidad del Sonido (1-10):</label>
                <input type="number" id="sonido" name="sonido" min="1" max="10" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="imagen">Calidad de la Imagen (1-10):</label>
                <input type="number" id="imagen" name="imagen" min="1" max="10" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="facilidadUso">Facilidad de Uso (1-10):</label>
                <input type="number" id="facilidadUso" name="facilidadUso" min="1" max="10" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Añadir Encuesta</button>
        </form>

        <h3 class="mb-3">Listado de Encuestas</h3>
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>Sonido</th>
                    <th>Imagen</th>
                    <th>Facilidad de Uso</th>
                    <th>Media</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Encuesta> encuestas = (List<Encuesta>) application.getAttribute("encuestas");

                    if (encuestas != null && !encuestas.isEmpty()) {
                        double mediaSonido = 0, mediaImagen = 0, mediaFacilidad = 0;
                        int totalEncuestas = encuestas.size();

                        for (Encuesta encuesta : encuestas) {
                            mediaSonido += encuesta.getSonido();
                            mediaImagen += encuesta.getImagen();
                            mediaFacilidad += encuesta.getFacilidadUso();
                %>
                <tr>
                    <td><%= encuesta.getSonido() %></td>
                    <td><%= encuesta.getImagen() %></td>
                    <td><%= encuesta.getFacilidadUso() %></td>
                    <td><%= String.format("%.2f", encuesta.calcularMedia()) %></td>
                </tr>
                <%
                        }

                        mediaSonido /= totalEncuestas;
                        mediaImagen /= totalEncuestas;
                        mediaFacilidad /= totalEncuestas;
                %>
            </tbody>
        </table>

        <h3 class="mt-4">Media de Puntuaciones</h3>
        <p><strong>Calidad del Sonido:</strong> <%= String.format("%.2f", mediaSonido) %></p>
        <p><strong>Calidad de la Imagen:</strong> <%= String.format("%.2f", mediaImagen) %></p>
        <p><strong>Facilidad de Uso:</strong> <%= String.format("%.2f", mediaFacilidad) %></p>

        <h3 class="mt-4">Encuestas con baja puntuación (media &lt; 5)</h3>
        <ul class="list-group">
            <%
                for (Encuesta encuesta : encuestas) {
                    if (encuesta.calcularMedia() < 5) {
            %>
            <li class="list-group-item"><%= encuesta.toString() %></li>
            <%
                    }
                }
            %>
        </ul>

        <%
            } else {
        %>
        <p class="text-center">No hay encuestas aún.</p>
        <%
            }
        %>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
