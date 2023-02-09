class TodosController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @todos = Todo.all
    render :index
  end

  def show
    @todo = Todo.find_by(id: params[:id])
    render :show
  end

  def new
    @todo = Todo.new
    render :new
  end

  def create
    @todo = Todo.new(
      user_id: current_user.id,
      title: params[:todo][:title],
      description: params[:todo][:description],
      deadline: params[:todo][:deadline],
      completed: params[:todo][:completed],
    )
    if @todo.save
      redirect_to "/todos"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @todo = Todo.find_by(id: params[:id])
    if @todo.user_id == current_user.id
      render :edit
    end
  end

  def update
    @todo = Todo.find_by(id: params[:id])
    if @todo.user_id == current_user.id
      if @todo.update(
        title: params[:todo][:title],
        description: params[:todo][:description],
        deadline: params[:todo][:deadline],
        completed: params[:todo][:completed],
      )
        redirect_to "/todos"
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to "/todos", status: :see_other
    end
  end

  def destroy
    @todo = Todo.find_by(id: params[:id])
    if @todo.user_id == current_user.id
      @todo.destroy
      redirect_to "/todos", status: :see_other
    else
      redirect_to "/cats", status: :see_other
    end
  end
end
