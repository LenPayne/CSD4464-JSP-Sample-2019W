<%-- 
    Document   : index
    Created on : 28-Jan-2019, 7:51:00 PM
    Author     : Len Payne <len.payne@lambtoncollege.ca>
--%>

<%-- Imports are managed by annotated tags --%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- The following two tags import a class and set its property based on
     form input from the user. This is an integer field, so if it is not
     initialized, its value will be zero. --%>
<jsp:useBean id="obj" class="beans.GameBean" />
<jsp:setProperty name="obj" property="number" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CSD-4464 JSP Sample</title>
        <link href="styles.css" rel="stylesheet" />
    </head>
    <body>
        <div class="main">
            <h1>CSD-4464 JSP Samples</h1>
            <p>This page is a basic example of a JavaServer Pages (JSP) document. We
                will use it to show a few barebones examples of Java embedded into a
                web-accessible document.</p>
            <p><span class="warn">NOTE: JSP is not a recommended technology for new
                    projects.</span> It is recommended to use one of the following
                    technologies for a new project:</p>
            
            <% 
                // Note: anything within a code block is operated on as regular Java
                // Here, we create a Map with some values to loop through.
                Map<String, String> links = new HashMap<String, String>();
                links.put("Spring", "http://spring.io/");
                links.put("JavaServer Faces (JSF)", "http://www.javaserverfaces.org/");
                links.put("Google Web Toolkit (GWT)", "http://www.gwtproject.org/");
            %>
            <ul>
                <%-- You can switch to/from Java to perform complex logic --%>
                <% for(String key : links.keySet()) { %>
                    <%-- The <%= ... %> block is used to output a value --%>
                    <li><a href="<%= links.get(key) %>"><%= key %></a></li>
                <% } %>
            </ul>
            
            <%-- The example below uses the Bean set above to play a game --%>
            <h2>Play a Guessing Game</h2>
            <p>Your last guess was: <%= obj.getNumber() %></p>
            <p>Result: <%= obj.validate() %></p>
            <form>
                <label for="number"><%= obj.getPrompt() %></label>
                <%-- In the following:
                     - the name="number" attribute is what feeds a value to the 
                       jsp:setProperty method above
                     - the id="number" attribute is only used to tie to the label
                     - the value="..." is used to retrieve the last value to fill
                       in as a placeholder --%>
                <input name="number" id="number" value="<%= obj.getNumber() %>" />
                <input type="submit" />
            </form>
                
            <%-- To organize your project, you can also include other pages --%>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
