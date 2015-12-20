class BooksController < ApplicationController
  
  def index
    @title = "Tri Thức trong Tầm Tay"
    @categories = Category.where(delete_flag: 0)
    
    @subcategories = Subcategory.where(delete_flag: 0)
    
    @TienHiepbooks = Book.where(delete_flag: 0)
                    .where(subcategory: 2)
                    .order('created_at DESC')
                    .limit(4)
    
    @KiemHiepbooks = Book.where(delete_flag: 0)
                    .where(subcategory: 3)
                    .order('created_at DESC')
                    .limit(4)
    
    @NgonTinhbooks = Book.where(delete_flag: 0)
                    .where(subcategory: 4)
                    .order('created_at DESC')
                    .limit(4)
    
    @KinhDienbooks = Book.where(delete_flag: 0)
                    .where(subcategory: 1)
                    .order('created_at DESC')
                    .limit(4)
    
    @lastUpdatedbook  = Book.where(delete_flag: 0)
                            .order('updated_at DESC')
                            .limit(5)
    
    @hotBooks = Book.where(delete_flag: 0)
                   .order('updated_at DESC')
                   .limit(10)
    
  end

  def show
    @categories = Category.where(delete_flag: 0)
    
    
    @subcategories = Subcategory.where(delete_flag: 0)
    
    
    @book = Book.friendly.find(params[:id]) rescue nil
    
    
    
    unless @book.blank?
        if params[:page].to_i >= 0
            @chapters = @book.chapters.where(delete_flag: 0)
                                      .all
                                      .paginate(page: params[:page], per_page: 100)
            @hotBooks = Book.where(delete_flag: 0)
                            .order('updated_at DESC')
                            .limit(10)                    
            @title = @book.subcategory.name + " | " + @book.name
        else
            redirect_to "http://daithuvien.com"
        end
    else
        redirect_to root_path
    end
  end
end
