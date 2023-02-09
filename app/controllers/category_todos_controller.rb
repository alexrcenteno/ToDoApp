class CategoryTodosController < ApplicationController
  def index
    @category_todos = CategoryTodo.all
    render :index
  end

  def show
    @category_todo = CategoryTodo.find_by(id: params[:id])
    render :show
  end

  def new
    @category_todo = CategoryTodo.new
    render :new
  end

  def create
    @category_todo = CategoryTodo.create(
      todo_id: params[:category_todo][:todo_id],
      category_id: params[:category_todo][:category_id]
    )
    redirect_to "/category_todos"
  end

  def edit
    @category_todo = CategoryTodo.find_by(id: params[:id])
    render :edit
  end

  def update
    @category_todo = CategoryTodo.find_by(id: params[:id])
    @category_todo.update()
    redirect_to "/category_todos"
  end

  def destroy
    @category_todo = CategoryTodo.find_by(id: params[:id])
    @category_todo.destroy
    redirect_to "/category_todos", status: :see_other
  end
end
