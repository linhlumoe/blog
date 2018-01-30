class RegistrationsController < ApplicationController

  def index
    @users = User.all
    @users = Kaminari.paginate_array(@users).page(params[:page]).per(30)
  end

end
