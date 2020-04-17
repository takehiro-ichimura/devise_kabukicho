class DmsController < ApplicationController
  before_action :authenticate_user!
  def index
    #@dms = current_user.dms.all.order(created_at: :desc)
    @dms = Dm.where(receive_user_id: current_user.id)
    .or(Dm.where(user_id: current_user.id))
  end
  def show
    @user = User.find_by(id: params[:id])
    @dms = Dm
    .where(user_id:current_user.id, receive_user_id: params[:id])
    .or(Dm.where(user_id: params[:id], receive_user_id:current_user.id))
    .order(created_at: :desc)
  end
  def dmsend
    current_user.sent_dms(User.find_by(id: params[:id]), params[:content])
    redirect_to("/dms/#{params[:id]}")
  end
end