class Admin::UsersController < Admin::ApplicationController
    before_filter :verify_logged_in
  def new
      @page_title = 'Add User'
      @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = 'Đăng ký tài khoản Thành Công'
        redirect_to admin_users_path
      else
          render 'new'
      end
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      
      if @user.update(user_params)
          flash[:success] = 'Cập nhật tài khoản Thành Công'
          redirect_to admin_users_path
      else
        render 'new'
      end
  end

  def index
      @users = User.all
  end

  def show
  end

  def destroy
      @user = User.find(params[:id])
      @category.destroy
      
      flash[:success] = 'Xóa tài khoản Thành Công'
      redirect_to admin_users_path
  end
  
  private
  def user_params
      params.require(:user).permit(:user_name, :email, :password)
  end
end
