class Admin::AuthorsController < Admin::ApplicationController
  before_filter :verify_logged_in  
  
  def new
    @page_title = "Quản Lý Tác Giả"
    @author = Author.new
    @user =User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
    @author = Author.new(author_params)
    @author.created_by = @user.user_name
    @author.updated_by = @user.user_name
    @author.delete_flag = 0
    
      if @author.save
        flash[:success] = 'Tạo mới Tác Giả Thành Công'
        redirect_to admin_authors_path
      else
          render 'new'
      end
  end

  def edit
      @author = Author.friendly.find(params[:id])
  end

  def update
    @author = Author.friendly.find(params[:id])
    @user = User.find(session[:user_id])
    
      if @author.update(:updated_by => @user.user_name, :updated_at => DateTime.now, :author_name => author_params[:author_name])
      #if @user.update(user_params)
          flash[:success] = 'Cập nhật Tác Giả Thành Công'
          redirect_to admin_authors_path
      else
        render 'new'
      end
  end

  def destroy
    @author = Author.friendly.find(params[:id])
    @user = User.find(session[:user_id])
    @author.update(:updated_by => @user.user_name, :updated_at => DateTime.now, :delete_flag => 1)
    flash[:success] = 'Xóa Tác giả Thành Công'
      redirect_to admin_authors_path
  end

  def show
  end

  def index
      if params[:search]
        @authors = Author.search(params[:search]).where(delete_flag: 0).all
      else
        @authors = Author.where(delete_flag: 0).all
      end
  end
  
  private
  def author_params
      params.require(:author).permit(:author_name, :created_by, :updated_by, :delete_flag, :slug)
  end
end
