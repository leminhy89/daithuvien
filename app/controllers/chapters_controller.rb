class ChaptersController < ApplicationController
    
  def show
    @categories = Category.where(delete_flag: 0)
    @subcategories = Subcategory.where(delete_flag: 0)
    @book = Book.friendly.find(params[:book_id]) rescue nil
    
    unless @book.blank?
        @chapter = Chapter.where(book_id: @book.id).friendly.find(params[:id]) rescue nil
        
        unless @chapter.blank?
            @previousChapter = Chapter.where(book_id: @book.id)
                                      .where("id < ?", @chapter.id)
                                      .last
    
            @nextChapter = Chapter.where(book_id: @book.id)
                                  .where("id > ?", @chapter.id)
                                  .first
            @title = @book.name + " | " + @chapter.name
        else
            redirect_to truyen_path(@book)
        end
    else
        redirect_to root_path
    end
    #if @nextChapter != nil
    #    @nextChapter = @nextChapter.first
    #end
                          
  end
end
