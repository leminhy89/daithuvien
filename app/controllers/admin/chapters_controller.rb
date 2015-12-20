
      
class Admin::ChaptersController < Admin::ApplicationController

  before_filter :verify_logged_in
  
  def new
    @page_title = "Quản Lý Chương"
    @book = Book.friendly.find(params[:book_id])
    @chapter = Chapter.new
    @chapter.book_id = @book.id
    @user =User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
    @chapter = Chapter.new(chapter_params)
    @book = Book.friendly.find(chapter_params[:book_id])
    @chapter.created_by = @user.user_name
    @chapter.updated_by = @user.user_name
    @chapter.delete_flag = 0
    
      if @chapter.save
        flash[:success] = 'Tạo mới Chương Thành Công'
        redirect_to admin_book_chapters_path(@book)
      else
          render 'new'
      end
  end

  def edit
    @book = Book.friendly.find(params[:book_id])
    @chapter = Chapter.where(book_id: @book.id).friendly.find(params[:id])
    
  end

  def update
    @user = User.find(session[:user_id])
    @book = Book.friendly.find(chapter_params[:book_id])
    @chapter = Chapter.where(book_id: @book.id).friendly.find(params[:id])
    
      if @chapter.update(:updated_by => @user.user_name, :updated_at => DateTime.now, :name => chapter_params[:name], :book_id =>chapter_params[:book_id], :content =>chapter_params[:content])
      #if @user.update(user_params)
          flash[:success] = 'Cập nhật Chương Sách Thành Công'
          redirect_to admin_book_chapters_path(@book)
      else
        render 'new'
      end
  end

  def destroy
    
    @book = Book.friendly.find(params[:book_id])
    @chapter = Chapter.where(book_id: @book.id).friendly.find(params[:id])
    logger.debug "chapterId: #{@chapter.id}"
    @user = User.find(session[:user_id])
    @chapter.update(:updated_by => @user.user_name, :updated_at => DateTime.now, :delete_flag => 1)
    flash[:success] = 'Xóa Chương Sách Thành Công'
      redirect_to admin_book_chapters_path(@book)
  end

  def index
    if params.has_key?(:book_id)
        @book = Book.friendly.find(params[:book_id])
        unless @book.blank?
            @chapters = Chapter.where(book_id: @book.id).
                                where(delete_flag: 0).
                                all.
                                paginate(page: params[:page], per_page: 100)
        else
            redirect_to admin_books_path
        end
    else
        redirect_to admin_books_path
    end
  end
  
  def import
      
      @book = Book.friendly.find(params[:book_id])
      @user = User.find(session[:user_id])
      el = Roo::Spreadsheet.open(@book.slug+".xlsx")
      xls = Roo::Excelx.new(@book.slug+".xlsx")
     
      #594.upto(595) do |line| #start and end of row
      1.upto(xls.last_row) do |line| #start and end of row
        name = xls.cell(line,'A')
        slug = xls.cell(line,'B')
        content = xls.cell(line,'C')
        @chapter = Chapter.create(:book_id => @book.id, :name => name,:content => content,:created_by => @user.user_name, :updated_by => @user.user_name, :delete_flag => 0, :created_at => DateTime.now, :updated_at => DateTime.now, :slug => slug )
      end
      
      flash[:success] = 'Cập nhật Chương Sách Thành Công'
      redirect_to admin_book_chapters_path(@book)
  end
  
  
  
  def show
      # Find the category belonging to the given id
      #@book = Book.find(params[:id])
      # Grab all sub-categories
      #@chapters = @book.chapters
      # We want to reuse the index renderer:
      #render :action => :index
  end
  
  private
      def chapter_params
          params.require(:chapter).permit(:name, :created_by, :updated_by, :delete_flag, :book_id, :content, :slug)
      end
end
