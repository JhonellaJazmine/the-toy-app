class ProfileController < ApplicationController
    before_action :require_user_logged_in!
    def index
    
        @user = User.find(params[:id])
        @microposts = @user.microposts
        # @microposts = Current.user.microposts.all.order(:user_id)
        # @users = Current.user.name
        # @microposts = Micropost.user(params[:id])
    end   
end

