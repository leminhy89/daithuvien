class Admin::SessionsController < Admin::ApplicationController
    layout 'admin/login'
  def new
  end

  def create
      user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        flash[:success] = "Đăng nhập thành công"
        redirect_to admin_users_path
      else
          #flash.now.alert.danger = "Sai email hoặc Mật khẩu, vui lòng đăng nhập lại"
          flash.now[:danger] = "Sai email hoặc Mật khẩu, vui lòng đăng nhập lại"
          render 'new'
      end
  end
  
  def destroy
      session[:user_id] = nil
      flash[:success] = "Đăng xuất thành công"
      redirect_to admin_login_path
  end
end
