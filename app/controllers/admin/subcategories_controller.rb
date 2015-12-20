class Admin::SubcategoriesController < Admin::ApplicationController
  before_filter :verify_logged_in
  
  def new
    @page_title = "Quản Lý Danh Mục con"
    @subCate = Subcategory.new
    @user =User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
    @subCate = Subcategory.new(subCate_params)
    @subCate.created_by = @user.user_name
    @subCate.updated_by = @user.user_name
    @subCate.delete_flag = 0
    
      if @subCate.save
        flash[:success] = 'Tạo mới Danh mục con Thành Công'
        redirect_to admin_subcategories_path
      else
          render 'new'
      end
  end

  def edit
    @subCate = Subcategory.find(params[:id])
  end

  def update
    @subCate = Subcategory.find(params[:id])
    @user = User.find(session[:user_id])
    
      if @subCate.update(:updated_by => @user.user_name, :updated_at => DateTime.now, :name => subCate_params[:name], :category_id =>subCate_params[:category_id])
      #if @user.update(user_params)
          flash[:success] = 'Cập nhật Danh mục con Thành Công'
          redirect_to admin_subcategories_path
      else
        render 'new'
      end
  end

  def destroy
    @subCate = Subcategory.find(params[:id])
    @user = User.find(session[:user_id])
    @subCate.update(:updated_by => @user.user_name, :updated_at => DateTime.now, :delete_flag => 1)
    flash[:success] = 'Xóa trạng thái Thành Công'
      redirect_to admin_subcategories_path
  end

  def index
    @subCates = Subcategory.where(delete_flag: 0).all
  end

  def show
      # Find the category belonging to the given id
      @category = Category.find(params[:id])
      # Grab all sub-categories
      @subCates = @category.subcategories
      # We want to reuse the index renderer:
      render :action => :index
  end
  
  private
  def subCate_params
      params.require(:subcategory).permit(:name, :created_by, :updated_by, :delete_flag, :category_id)
  end
end
