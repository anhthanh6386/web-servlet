	<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
  <head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  <body>
      <main class="container">
          <section class="row">
              <div class="offset-3 col-6" >
                  <form action="/Asm4/S" method="post">
                      <div class="card mt-5" style="background: url(/Asm4/images/hinh-nen-den-25.jpg) no-repeat;background-size: cover;">
                          <div class="card-header" style="color: white">Send Video to your Friends</div>
                          <div class="card-body">
                              <div class="form-group">
                                <label for="email" style="color: white">You Friends' email:</label>
                                <input type="email" class="form-control" name="emailshare" id="Email" aria-describedby="emailHelperid" placeholder="Email">
                                <small id="emailHelperid" class="form-text text-muted" style="color: white">Email is required!</small>
                              </div>
                          </div>
                          <div class="card-foooter">
                              <button  class="btn btn-lg btn-primary btn-block"  >Send</button>
                          </div>
                      </div>
                  </form>
              </div>
          </section>
      </main>
  </body>
</html>