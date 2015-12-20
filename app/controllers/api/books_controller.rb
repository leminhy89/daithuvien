class Api::BooksController < Api::ApplicationController
    def index
        if params[:c] #category
            if params[:a]
                if params[:page]
                    if params[:page].to_i > 0
                        @books = Book.where(subcategory: params[:c]).where(author_id: params[:a]).where(delete_flag: 0).order('created_at DESC').limit(20).offset((params[:page].to_i - 1) * 20)                         
                        render json: @books, serializer: ActiveModel::ArraySerializer, each_serializer: BookSerializer
                    end
                else
                    @books = Book.where(subcategory: params[:c]).where(author_id: params[:a]).where(delete_flag: 0).all.order('created_at DESC')
                    render json: @books, serializer: ActiveModel::ArraySerializer, each_serializer: BookSerializer
                end
            else
                if params[:page]
                    if params[:page].to_i > 0
                        @books = Book.where(subcategory: params[:c]).where(delete_flag: 0).order('created_at DESC').limit(20).offset((params[:page].to_i - 1) * 20)                         
                        render json: @books, serializer: ActiveModel::ArraySerializer, each_serializer: BookSerializer
                    end
                else
                    @books = Book.where(subcategory: params[:c]).where(delete_flag: 0).order('created_at DESC').all
                    render json: @books, serializer: ActiveModel::ArraySerializer, each_serializer: BookSerializer
                end
            end
        elsif params[:a]
            if params[:c]
                @books = Book.where(subcategory: params[:c]).where(author_id: params[:a]).order('created_at DESC').where(delete_flag: 0).all
                render json: @books, serializer: ActiveModel::ArraySerializer, each_serializer: BookSerializer
            else
                @books = Book.where(author_id: params[:a]).where(delete_flag: 0).order('created_at DESC').all
                render json: @books, serializer: ActiveModel::ArraySerializer, each_serializer: BookSerializer
            end
        else
            if params[:page]
                if params[:page].to_i > 0
                    @books = Book.where(delete_flag: 0).order('created_at DESC').limit(20).offset((params[:page].to_i - 1) * 20)                         
                    render json: @books, serializer: ActiveModel::ArraySerializer, each_serializer: BookSerializer
                end
            else
                @books = Book.all.order('created_at DESC')
                render json: @books, serializer: ActiveModel::ArraySerializer, each_serializer: BookSerializer
            end
            
        end
    end
end