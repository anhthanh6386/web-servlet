<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Forgot Password</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/css/sb-admin-2.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">Quên mật khẩu?</h1>
                                        <p class="mb-4">Chúng tôi hiểu nó, mọi thứ sẽ được giải quyết. Chỉ cần nhập tên tài khoản của bạn dưới đây và chúng tôi sẽ gửi cho bạn một mã OTP để đặt lại mật khẩu của bạn!</p>
                                    </div>
                                    <form class="user" action="/Asm4/Email" method="post">
                                    	<span style="color: red;font-size: 13">${ checkUsername }</span>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp" name="taikhoan1" value="${ tk }"
                                                placeholder="Nhập tên tài khoản của bạn">
                                        </div>            
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="exampleInputEmail" name="matkhaumoi" value="${ mk1 }"
                                                placeholder="Nhập mật khẩu mới !">
                                        </div>
                                        <span style="color: red;font-size: 13">${ messengerMatkhau }</span>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="exampleInputEmail" name="nhaplai" value="${ mk2 }"
                                                placeholder="Xác nhận mật khẩu mới !">
                                        </div>
                                        
                                        <div class="form-group">
                                  	        
                                            <input type="number" class="form-control form-control-user"
                                                id="exampleInputEmail" name="otp" 
                                                placeholder="OTP">
                                        </div>
                                         <span
											style="color: red;">${messengerOTP}</span><br>
										<button formaction="OTP" class="btn btn-primary btn-user btn-block">Lấy Mã Xác Nhận</button>
                                        <button class="btn btn-primary btn-user btn-block"  formaction="/Asm4/forgot">Đổi mật khẩu</button>
                                        
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="/Asm4/dang-ki">Tạo một tài khoản!</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="<%=request.getContextPath()%>/dang-nhap">Bạn đã có tài khoản? Đăng nhập!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>

</body>

</html>