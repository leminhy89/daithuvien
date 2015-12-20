class SearchsController < ApplicationController
  def index
      @title = "Tìm kiếm"
      
      @categories = Category.where(delete_flag: 0)
      @subcategories = Subcategory.where(delete_flag: 0)
        
      @books = Book.where(delete_flag: 0).joins(:author).advsearch(params[:search]).order("created_at DESC").all.paginate(page: params[:page], per_page: 10)
      @hotBooks = Book.where(delete_flag: 0)
                   .order('updated_at DESC')
                   .limit(10)
  end
end
