class CategoriesController < ApplicationController
    def index 
        @page_name = "Categories"
        @category = Category.find(1)
    end
end
