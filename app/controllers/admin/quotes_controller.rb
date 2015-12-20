class Admin::QuotesController < Admin::ApplicationController
  before_filter :verify_logged_in
  
  def new
    @page_title = "Quản Lý Trích Dẫn"
    @quote = Quote.new
    @user =User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
    @quote = Quote.new(quote_params)
    @quote.created_by = @user.user_name
    @quote.updated_by = @user.user_name
    @quote.delete_flag = 0
    
      if @quote.save
        flash[:success] = 'Tạo mới Trích Dẫn Thành Công'
        redirect_to admin_quotes_path
      else
          render 'new'
      end
  end

  def edit
    @quote = Quote.find(params[:id])
  end

  def update
    @quote = Quote.find(params[:id])
    @user = User.find(session[:user_id])
    
      if @quote.update(:updated_by => @user.user_name, :updated_at => DateTime.now, :quote_text => quote_params[:quote_text], :quote_from => quote_params[:quote_from], :quote_at => quote_params[:quote_at])
      #if @user.update(user_params)
          flash[:success] = 'Cập nhật Trích Dẫn Thành Công'
          redirect_to admin_quotes_path
      else
        render 'new'
      end
  end

  def destroy
    @quote = Quote.find(params[:id])
    @user = User.find(session[:user_id])
    @quote.update(:updated_by => @user.user_name, :updated_at => DateTime.now, :delete_flag => 1)
    flash[:success] = 'Xóa Trích Dẫn Thành Công'
      redirect_to admin_quotes_path
  end

  def index
    @quotes = Quote.where(delete_flag: 0).all
  end

  def show
  end
  
  private
  def quote_params
      params.require(:quote).permit(:quote_text, :quote_at, :quote_from, :created_by, :updated_by, :delete_flag)
  end
end
