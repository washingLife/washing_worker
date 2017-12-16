class UsersController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_user, only: [:show]

  def index
    @users = User.paginate(page: params[:page], per_page: 10).order(updated_at: :desc)
  end

  def show
    @orders = @user.orders.paginate(page: params[:order_page], per_page: 10).order(id: :desc)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end