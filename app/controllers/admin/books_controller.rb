class Admin::BooksController < Admin::ApplicationController
  before_filter :verify_logged_in
  
  def new
    @page_title = "Quản Lý Sách"
    @book = Book.new
    @user =User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
    @book = Book.new(book_params)
    
    if params[:book][:image].blank?
        @book.image = nil
    end
    
    @book.created_by = @user.user_name
    @book.updated_by = @user.user_name
    @book.delete_flag = 0
    
      if @book.save
        flash[:success] = 'Tạo mới Sách Thành Công'
        redirect_to admin_books_path
      else
          render 'new'
      end
  end

  def edit
    @book = Book.friendly.find(params[:id])
  end

  def update
    @book = Book.friendly.find(params[:id])
    @user = User.find(session[:user_id])
    
    if params[:book][:image].blank?
        @book.image = nil
    end
    
      if @book.update(:updated_by => @user.user_name, :updated_at => DateTime.now, :name => book_params[:name], :subcategory_id =>book_params[:subcategory_id], :type_id =>book_params[:type_id],:status_id =>book_params[:status_id], :author_id =>book_params[:author_id],
          :image =>book_params[:image], :description =>book_params[:description])
      #if @user.update(user_params)
          flash[:success] = 'Cập nhật Sách Thành Công'
          redirect_to admin_books_path
      else
        render 'new'
      end
  end

  def destroy
    @book = Book.friendly.find(params[:id])
    @user = User.find(session[:user_id])
    @book.update(:updated_by => @user.user_name, :updated_at => DateTime.now, :delete_flag => 1)
    flash[:success] = 'Xóa Sách Thành Công'
      redirect_to admin_books_path
  end

  def index
      if params[:search]
        @books = Book.where(delete_flag: 0).search(params[:search]).order("created_at DESC").all.paginate(page: params[:page], per_page: 50)
      else
        @books = Book.where(delete_flag: 0).order("created_at DESC").all.paginate(page: params[:page], per_page: 50)
      end
  end

  def show
  end
  
  private
      def book_params
          params.require(:book).permit(:name, :created_by, :updated_by, :delete_flag, :subcategory_id, :type_id, :status_id, :author_id, :countview_id, :image, :description, :slug)
      end
end
