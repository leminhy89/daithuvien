class Admin::StatusesController < Admin::ApplicationController
  
  before_filter :verify_logged_in
  
  def new
    @page_title = "Quản Lý Trạng Thái"
    @status = Status.new
    @user =User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
    @status = Status.new(status_params)
    @status.created_by = @user.user_name
    @status.updated_by = @user.user_name
    @status.delete_flag = 0
    
      if @status.save
        flash[:success] = 'Tạo mới trạng thái Thành Công'
        redirect_to admin_statuses_path
      else
          render 'new'
      end
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    @user = User.find(session[:user_id])
    
      if @status.update(:updated_by => @user.user_name, :updated_at => DateTime.now, :name => status_params[:name])
      #if @user.update(user_params)
          flash[:success] = 'Cập nhật trạng thái Thành Công'
          redirect_to admin_statuses_path
      else
        render 'new'
      end
  end

  def destroy
    @status = Status.find(params[:id])
    @user = User.find(session[:user_id])
    @status.update(:updated_by => @user.user_name, :updated_at => DateTime.now, :delete_flag => 1)
    flash[:success] = 'Xóa trạng thái Thành Công'
      redirect_to admin_statuses_path
  end

  def index
    @statuses = Status.where(delete_flag: 0).all
  end

  def show
  end
  
  private
  def status_params
      params.require(:status).permit(:name, :created_by, :updated_by, :delete_flag)
  end
end
