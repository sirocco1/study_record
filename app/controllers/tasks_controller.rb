class TasksController < ApplicationController
  before_action :authenticate_user!

  def show
    @task = Task.find(params[:id])
    if @task.user.id != current_user.id
      redirect_to root_path
    end
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to user_path(current_user.id), notice: "新規投稿が正常に完了しました"
    else
      @user = current_user
      @tasks = Task.all.order('day desc')
      @tasks = Task.page(params[:page]).order('day desc')
      render template: "users/show"
    end
  end

  def edit
    @task = Task.find(params[:id])
    if @task.user.id != current_user.id
      redirect_to root_path
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to user_path(current_user.id), notice: "編集が正常に完了しました"
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to user_path(current_user.id), notice: "削除が正常に完了しました"
  end

  private
  def task_params
    params.require(:task).permit(:day, :study_time, :study_body)
  end

end
