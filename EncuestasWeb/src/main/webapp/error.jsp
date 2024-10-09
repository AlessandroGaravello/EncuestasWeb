<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            color: #721c24;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #f5c6cb;
            background-color: #f8d7da;
        }
        h2 {
            text-align: center;
            color: #721c24;
        }
        p {
            text-align: center;
            font-size: 18px;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            background-color: #721c24;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        a:hover {
            background-color: #a94442;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>¡Ups! Algo salió mal</h2>
        <p>Ha ocurrido un error al procesar la solicitud. Por favor, revisa los datos ingresados e intenta de nuevo.</p>
        <a href="encuestas.jsp">Volver a la página de encuestas</a>
    </div>
</body>
</html>
