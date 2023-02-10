class TodosByCategoriesController < ApplicationController
  before_action :authenticate_user

  def index
    @categories = Category.all
    render :index
  end
end
