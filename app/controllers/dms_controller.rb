class DmsController < ApplicationController
  before_action :authenticate_user!
  before_action :manforbid_unregist
  before_action :womanforbid_unregist
  def index
    #@dms = current_user.dms.all.order(created_at: :desc)
    @dms = Dm.where(receive_user_id: current_user.id)
    .or(Dm.where(user_id: current_user.id))
  end
  def show
    if params[:id].to_i == current_user.id
      redirect_to("/dms")
    end
    if current_user.usertype==2 and User.find_by(id: params[:id]).usertype==1
      if Dm
        .where(user_id:current_user.id, receive_user_id: params[:id])
        .or(Dm.where(user_id: params[:id], receive_user_id:current_user.id))
        .order(created_at: :desc).count == 0
        flash[:notice] = "このユーザーからDMが来るまではDMできません"
        redirect_to("/users/#{current_user.id}")
      end
    end
    @user = User.find_by(id: params[:id])
    @dms = Dm
    .where(user_id:current_user.id, receive_user_id: params[:id])
    .or(Dm.where(user_id: params[:id], receive_user_id:current_user.id))
    .order(created_at: :desc)
  end
  def dmsend
    if current_user.usertype==2 and User.find_by(id: params[:id]).usertype==1
      if Dm
        .where(user_id:current_user.id, receive_user_id: params[:id])
        .or(Dm.where(user_id: params[:id], receive_user_id:current_user.id))
        .order(created_at: :desc).count == 0
        flash[:notice] = "このユーザーからDMが来るまではDMできません"
        redirect_to("/users/#{current_user.id}")
      end
    end
    current_user.sent_dms(User.find_by(id: params[:id]), params[:content])
    redirect_to("/dms/#{params[:id]}")
  end
end