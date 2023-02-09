class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render :index
  end

  def show
    @category = Category.find_by(id: params[:id])
    render :show
  end

  def new
    @category = Category.new
    render :new
  end

  def create
    @category = Category.create(
      name: params[:category][:name],
    )
    if @todo.save
      redirect_to "/categories"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find_by(id: params[:id])
    render :edit
  end

  def update
    @category = Category.find_by(id: params[:id])
    @category.update(
      name: params[:category][:name],
    )
    redirect_to "/categories"
  end

  def destroy
    @category = Category.find_by(id: params[:id])
    @category.destroy
    redirect_to "/categories", status: :see_other
  end
end
