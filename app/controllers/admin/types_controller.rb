class Admin::TypesController < Admin::ApplicationController
  
  before_filter :verify_logged_in  
  
  def new
    @page_title = "Quản Lý kiểu"
    @type = Type.new
    @user =User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
    @type = Type.new(type_params)
    @type.created_by = @user.user_name
    @type.updated_by = @user.user_name
    @type.delete_flag = 0
    
      if @type.save
        flash[:success] = 'Tạo mới kiểu sách Thành Công'
        redirect_to admin_types_path
      else
          render 'new'
      end
  end

  def edit
      @type = Type.find(params[:id])
  end

  def update
    @type = Type.find(params[:id])
    @user = User.find(session[:user_id])
    
      if @type.update(:updated_by => @user.user_name, :updated_at => DateTime.now, :name => type_params[:name])
      #if @user.update(user_params)
          flash[:success] = 'Cập nhật kiểu Thành Công'
          redirect_to admin_types_path
      else
        render 'new'
      end
  end

  def destroy
    @type = Type.find(params[:id])
    @user = User.find(session[:user_id])
    @type.update(:updated_by => @user.user_name, :updated_at => DateTime.now, :delete_flag => 1)
    flash[:success] = 'Xóa kiểu Thành Công'
      redirect_to admin_types_path
  end

  def show
  end

  def index
      @types = Type.where(delete_flag: 0).all
  end
  
  private
  def type_params
      params.require(:type).permit(:name, :created_by, :updated_by, :delete_flag)
  end
end
