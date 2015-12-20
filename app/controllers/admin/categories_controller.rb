class Admin::CategoriesController < Admin::ApplicationController
    
  before_filter :verify_logged_in
  
  def new
    @page_title = "Quản Lý Danh Mục"
    @cate = Category.new
    @user =User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
    @cate = Category.new(cate_params)
    @cate.created_by = @user.user_name
    @cate.updated_by = @user.user_name
    @cate.delete_flag = 0
    
      if @cate.save
        flash[:success] = 'Tạo mới Danh Mục Thành Công'
        redirect_to admin_categories_path
      else
          render 'new'
      end
  end

  def edit
      @cate = Category.find(params[:id])
  end

  def update
    @cate = Category.find(params[:id])
    @user = User.find(session[:user_id])
    
      if @cate.update(:updated_by => @user.user_name, :updated_at => DateTime.now, :name => cate_params[:name])
      #if @user.update(user_params)
          flash[:success] = 'Cập nhật Danh Mục Thành Công'
          redirect_to admin_categories_path
      else
        render 'new'
      end
  end

  def destroy
    @cate = Category.find(params[:id])
    @user = User.find(session[:user_id])
    @cate.update(:updated_by => @user.user_name, :updated_at => DateTime.now, :delete_flag => 1)
    flash[:success] = 'Xóa Danh Mục Thành Công'
      redirect_to admin_categories_path
  end

  def show
  end

  def index
      @cates = Category.where(delete_flag: 0).all
  end
  
  private
  def cate_params
      params.require(:category).permit(:name, :created_by, :updated_by, :delete_flag)
  end
end
