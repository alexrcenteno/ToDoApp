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
    if params[:category]
      cat = Category.find_by(name: params[:category])
      cat_todo = CategoryTodo.new(todo_id: params[:todo_id], category_id: cat.id)
      if cat_todo.save
        print("THAT SHIT SAVED")
      else
        print("MY GUY " + cat_todo.errors.full_messages.to_s)
      end
    else
      print("IT AIN'T RUNNING")
    end
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
