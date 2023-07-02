<%@ page import="entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"></script>

</head>
<body>
<%@include file="navbar.jsp" %>

<%
    String error = request.getParameter("error");
    String errEmail = request.getParameter("err-email");
    String errPassword = request.getParameter("err-password");
    String success = request.getParameter("success");
    User signUpAuthor = (User) session.getAttribute("currentUser");
%>

<section class="vh-100">
    <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-4 col-lg-6 col-xl-4 offset-xl-1">
                <form action="/login" method="post">
                    <%
                        if (error != null) {
                    %>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Incorrect email or password!</strong>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <%
                        }
                    %>
                    <%
                        if (errEmail != null) {
                    %>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Email is busy!</strong>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <%
                        }
                    %>
                    <%
                        if (errPassword != null) {
                    %>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Passwords are not same!</strong>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <%
                        }
                    %>
                    <div class="form-outline mb-4">
                        <h1>Hello User</h1>
                    </div>
                    <!-- Email input -->
                    <div class="form-outline mb-4">
                        <input name="email" type="email"  class="form-control form-control-lg"
                               placeholder="Enter a valid email address"/>
                    </div>

                    <!-- Password input -->
                    <div class="form-outline mb-3">
                        <input name="password" type="password"  class="form-control form-control-lg"
                               placeholder="Enter password"/>
                    </div>

                   <%-- <div class="d-flex justify-content-between align-items-center">
                        <!-- Checkbox -->
                        <div class="form-check mb-0">
                            <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3"/>
                            <label class="form-check-label" for="form2Example3">
                                Remember me
                            </label>
                        </div>
                    </div>--%>

                    <div class="text-center text-lg-start mt-4 pt-2">
                        <button type="submit" class="btn btn-primary btn-lg"
                                style="padding-left: 2.5rem; padding-right: 2.5rem;">Login
                        </button>
                        <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="#!"
                                                                                          class="link-danger">Register</a>
                        </p>
                    </div>

                </form>
            </div>
        </div>
    </div>
    <div
            class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
    </div>
</section>
</body>
</html>
