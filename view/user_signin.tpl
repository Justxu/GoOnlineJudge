{{define "content"}}
  <div class="flash alert alert-warning" id="signin_failed" style="display:none;">Incorrect Handle or Password.</div>
    <div class="row">
      <div class="col-lg-6">

        <form accept-charset="UTF-8" class="new_user form-horizontal" id="new_user">
          <legend>Sign In</legend>
          <div style="margin:0;padding:0;display:inline">
            <input name="utf8" type="hidden" value="✓">
          </div>

          <div class="form-group">
            <label for="user_handle" class="col-lg-2 control-label">Handle</label>
            <div class="col-lg-10">
              <input type="text" class="form-control" id="user_handle" name="user[handle]" placeholder="Handle" autofocus>
            </div>
          </div>

          <div class="form-group">
            <label for="user_password" class="col-lg-2 control-label">Password</label>
            <div class="col-lg-10">
              <input type="password" class="form-control" id="user_password" name="user[password]" placeholder="Password">
            </div>
          </div>

          <div class="form-group">
            <div class="col-lg-10 col-lg-offset-5">
              <div class="actions">
                <input class="btn btn-info" name="user_signin" type="submit" value="Sign In">
                 </div>
            </div>
          </div>
        </form>

      </div>
  </div>
  <script src="/static/js/bootstrap.min.js"></script>
  <script src="/static/material/js/material.min.js"></script>
  <a href="/user/signup">Register a new account.</a>
  <script type="text/javascript">
  $('#new_user').submit( function(e) {
    e.preventDefault();
    $.ajax({
      type:'POST',
      url:'/sess',
      data:$(this).serialize(),
      error: function() {
        $('#signin_failed').css('display', 'block');
      },
      success: function() {
        $('#signin_failed').css('display', 'none');

        if (document.referrer != ""){
          window.location = document.referrer;
        }else{
          window.location = "/";
        }
      }
    });
  });
  </script>
{{end}}
