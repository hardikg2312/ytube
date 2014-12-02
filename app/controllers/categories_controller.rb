class CategoriesController < ApplicationController

  def index
    @categories = Category.includes(:videos)
  end
end
