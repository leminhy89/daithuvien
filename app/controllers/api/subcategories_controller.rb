class Api::SubcategoriesController < Api::ApplicationController
    def index
        @subcategories = Subcategory.all
        render json: @subcategories, serializer: ActiveModel::ArraySerializer, each_serializer: SubcategorySerializer
        
    end
end