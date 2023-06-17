<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAOFactory"%>
<%@page import="Models.EventoDTO"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Lexend&display=swap');

        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Lexend', sans-serif;
        }

        .pag-container {
            display: flex;
            flex-direction: row;
            margin-top: 20px;
        }

        .pag-main {
            width: 80%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            margin-top: 50px;
        }

        .pag-subtitle-container {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 10px;
        }

        .pag-subtitle {
            font-size: 2em;
            margin-right: 10px;
        }


        .pag-search-container {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }

        .pag-search-input {
            width: 600px;
            height: 40px;
            padding: 5px;
            font-size: 1em;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .pag-search-button {
            width: 40px;
            height: 40px;
            margin-left: 10px;
            font-size: 1.5em;
            border-radius: 50%;
            border: none;
            background-color: #00B4CC;
            color: white;
            cursor: pointer;
        }

        .pag-event-container {
            border: 1px solid #ccc;
            padding: 20px;
            font-size: 1.2em;
            width: 80%;
            margin-top: 20px;
        }

        .event-container {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: flex-start;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            width: 80%;
        }

        .event-image {
            width: 100px;
            height: 100px;
            flex-shrink: 0;
            margin-top: 10px;
        }

        .event-name {
            font-weight: bold;
            margin-bottom: 10px;
        }

        .event-info {
            margin-bottom: 5px;
        }

        .event-button {
            background-color: red;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 3px;
            cursor: pointer;
            font-size: 0.8em;
            align-self: flex-start;
            margin-top: 10px;
        }

        .comment-container {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            margin-top: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            width: 80%;
        }

        .comment-logo {
            width: 40px;
            height: 40px;
            flex-shrink: 0;
            margin-right: 10px;
        }

        .comment-content {
            flex-grow: 1;
        }

        .comment-text {
            margin-bottom: 5px;
        }

        .comment-details {
            font-size: 0.8em;
        }

        .comment-author {
            margin-right: 5px;
        }

        .comment-date {
            color: #888;
        }

        .comment-button {
            margin-left: 10px;
        }

        .comment-button-gray {
            background-color: #ccc;
            color: #fff;
            border: none;
            padding: 6px 12px;
            border-radius: 3px;
            cursor: pointer;
            font-size: 0.8em;
        }

        .gray-rectangle {
            background-color: #ccc;
            padding: 20px;
            width: 80%;
            margin-top: 20px;
        }

        .container {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .box {
            width: 200px;
            height: 200px;
            margin: 10px;
            background-color: #ccc;
        }

        .event-button-centered {
            margin-left: auto;
            margin-right: auto;
            display: block;
        }

        .event-details {
            text-align: center;
        }

        .event-image {
            margin: 0 auto;
        }

    </style>
</head>
<body>
<%
String msg = (String) request.getAttribute("mensaje");
if (msg==null) msg="";
%>
<%=msg %>

<%@include file="../comun/header_Salir.jsp" %>
<div class="event-container">
    <div class="event-details">
        <div class="event-image" style="align-self: flex-end; margin-top: 10px;">
            <img src="../imgs/ims_usuarioimg.jpg" alt="ima" style="width: 600px;">
        </div>
    </div>

    <div class="event-details" style="text-align: center; align-self: flex-end; margin-top: -50px; margin-bottom: -20px; margin-right: 100px; font-size: 1.2em; margin-left: 10px; display: flex; flex-direction: column; align-items: center; justify-content: center;">
        <div class="event-name">Nombre de Evento</div>
        <div class="event-info">Fecha de Inicio: 01/01/01</div>
        <div class="event-info">Fecha Fin: 01/01/01</div>
        <div class="event-info">Categoría: Evento ProSalud</div>
        <button class="event-button event-button-centered">Asistiré!</button>
    </div>
</div>
