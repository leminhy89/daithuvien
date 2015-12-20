class CategoriesController < ApplicationController
    
    def index
        
    end
    
    def show
        @categories = Category.where(delete_flag: 0)
        @subcategories = Subcategory.where(delete_flag: 0)
        #@subcategory = Subcategory.find(params[:id])
        @subcategory = Subcategory.friendly.find(params[:id])
        @books = Book.where(delete_flag: 0)
                     .where(subcategory_id: @subcategory.id)
                     .order('created_at DESC')
                     .paginate(page: params[:page], per_page: 10)
        @hotBooks = Book.where(delete_flag: 0)
                        .order('updated_at DESC')
                        .limit(10)
        @title = "Thể Loại | "+@subcategory.name
    end
end
