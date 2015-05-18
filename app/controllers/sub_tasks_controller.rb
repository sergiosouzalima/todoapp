class SubTasksController < ApplicationController
  before_action :set_sub_task, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def index
    @sub_tasks = SubTask.all.where( task_id: params[ :id  ]  )
    @task = Task.find( params[ :id ] )
    respond_with(@sub_tasks)
  end

  def show
    respond_with(@sub_task)
  end

  def new
    @sub_task = SubTask.new
    @sub_task.task_id = params[:id]
    @sub_task.user_id = current_user.id
    @task = Task.find( params[:id] )
    respond_with(@sub_task)
  end

  def edit
  end

  def create
    @sub_task = SubTask.new(sub_task_params)
    @sub_task.save
    respond_with(@sub_task)
  end

  def update
    @sub_task.update(sub_task_params)
    respond_with(@sub_task)
  end

  def destroy
    @sub_task.destroy
    respond_with(@sub_task)
  end

  private
    def set_sub_task
      @sub_task = SubTask.find(params[:id])
    end

    def sub_task_params
      params.require(:sub_task).permit(:name, :task_id, :user_id)
    end
end
