class AuthorsController < ApplicationController
  
 def show
        @categories = Category.where(delete_flag: 0)
        @subcategories = Subcategory.where(delete_flag: 0)
        #@subcategory = Subcategory.find(params[:id])
        @author = Author.friendly.find(params[:id])
        @books = Book.where(delete_flag: 0)
                     .where(author_id: @author.id)
                     .order('created_at DESC')
                     .paginate(page: params[:page], per_page: 10)
        @hotBooks = Book.where(delete_flag: 0)
                        .order('updated_at DESC')
                        .limit(10)
        @title = "Tác giả | "+@author.author_name
    end
end
