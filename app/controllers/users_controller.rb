class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :screen_user, only: [:edit, :update]


  def index
    @users = User.all.page(params[:page])
    @search = User.ransack(params[:q])
    @users = @search.result
  end

  def show
    @user = User.find(params[:id])
    @task = Task.new
    @tasks = @user.tasks.all.order('day desc').page(params[:page])
    #user.idが持つtasks習得、全情報を習得　表示順をdescに指定、ページャー機能の追加。
    @total = @tasks.sum(:study_time)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user),notice: "編集が成功しました"
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :birthday, :profile_image, :age, :hometown, :gender, :body, :study_item)
  end

  def screen_user
    unless params[:id].to_i == current_user.id
      redirect_to root_url
    end
  end


end
