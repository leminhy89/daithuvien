class Mobile::BooksController < Mobile::ApplicationController
    
  def index
      @books = Book.where(delete_flag: 0)
                   .order('updated_at DESC')
                   .all
                   .paginate(page: params[:page], per_page: 10)
  end

  def show
  end
end
