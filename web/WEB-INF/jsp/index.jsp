<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
    </head>
    
    <body>
        <%@page import="con_MySql.con_DBs" %>
        <% request.setCharacterEncoding("UTF-8"); %>
        <%
            con_DBs conDB = new con_DBs();
            Boolean fromClass = conDB.createCon();
            if (fromClass == true)
            {
                 out.println("Connection to database Status: Successfull");
            }
            else
            {
                out.println("Could not connect to DB! Please check your connection");
            }
            
            String desc = request.getParameter("desc");
            String quan = request.getParameter("quan");
            String pri = request.getParameter("pri");
                
            if (desc != null && quan != null && pri != null)
            {
                Boolean update_DB = conDB.addItem(desc,quan,pri);
                if (update_DB == true)
                {
                    %>
                    <script type="text/javascript">
                        alert('New Record added!');
                    </script>
                    <%
                }
                else
                {
                    %>
                    <script type="text/javascript">
                        alert('Could not add record, please make sure all fields are completed');
                    </script>
                    <%
                }
            }
        %>
                
        <form METHOD="post">
            <table border="1">
                <tr>
                    <th>Description</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="desc" />
                    </td>
                    <td>
                        <input type="text" name="quan" />
                    </td>
                    <td>
                        <input type="text" name="pri" />
                    </td>
                </tr>
            </table>
            <input type="submit" value="Submit" />
        </form>
    </body>
</html>
