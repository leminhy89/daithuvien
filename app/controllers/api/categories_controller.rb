class Api::SubCategoriesController < Api::ApplicationController
    def index
        @subcateogories = Subcategory.all
        render json: @cateogories, serializer: ActiveModel::ArraySerializer, each_serializer: CategorySerializer
        
    end
end