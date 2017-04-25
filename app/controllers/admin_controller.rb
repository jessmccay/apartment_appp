class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize #see method below

  def index
    @users = User.all #display all users on the admin page
  end

  def update
    user = User.find(params[:id])
    #user.remove_role user.roles.last-- user only has one role
    user.add_role(:admin)
    redirect_to '/admin'
  end

  private

  def authorize
    if !current_user.has_role? :admin
      render text:"No access for you!"
    end
  end #make sure anyone who is not an admin cannot do anything in this controller

end
