class UsersController < ApplicationController
  before_action :manforbid_unregist, except: [:mancreate, :manregist]
  before_action :manforbid_unregist, except: [:womancreate, :womanregist]
  def index
    @users = User.all
  end
  def show
    @user = User.find_by(id: params[:id])
  end
  def manregist
    @manpropaty = Manpropaty.new
  end
  def mancreate
    @manpropaty = Manpropaty.new(
      user_id: current_user.id,
      height: params[:height],
      birth_date: params[:birth_date],
      tenmei: params[:tenmei],
      geinoujin: params[:geinoujin],
      honei: params[:honei],
      tomoei: params[:tomoei],
      nomikei: params[:nomikei],
      owaraikei: params[:owaraikei]
    )
    if @manpropaty.save
      flash[:notice] = "保存成功"
      redirect_to("/")
    else
      render("users/#{current_user.id}")
    end
  end
  def womanregist
    @womanpropaty = Womanpropaty.new
  end
  def womancreate
    @womanpropaty = Womanpropaty.new(
      user_id: current_user.id,
      height: params[:height],
      weight: params[:weight],
      birth_date: params[:birth_date],
      shokugyou: params[:shokugyou],
      income: params[:income]
    )
    if @womanpropaty.save
      flash[:notice] = "保存成功!!!"
      redirect_to("/")
    else
      render("users/#{current_user.id}")
    end
  end
end
