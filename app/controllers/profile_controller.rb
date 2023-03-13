class ProfileController < ApplicationController
    def index
        @microposts = Current.user.microposts.all.order(:user_id)
    end
end
