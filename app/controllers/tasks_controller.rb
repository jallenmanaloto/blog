class TasksController < ApplicationController
  before_action :get_category, except: [:today]

  def index
    @tasks = @category.tasks.sort_by &:created_at
  end

  def new
    @task = @category.tasks.build
  end

  def create
    @task = @category.tasks.build(task_params)
    if @task.save
      redirect_to category_task_path(@category, @task)
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to category_task_path(@category, @task)
    end
  end

  def destroy
    @task = Task.find(params[:id]).destroy
    redirect_to category_path(@category)
  end

  def today
    @tasks = Task.where("Date(created_at) = ?", Date.today)
  end

  private

  def get_category
    @category = Category.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:name, :body, :task_date, :category_id)
  end
end