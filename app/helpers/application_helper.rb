module ApplicationHelper

    def avatar_url(user)
        if user.avatar.attached?
            url_for(user.avatar)
        else
            ActionController::Base.helpers.asset_path('avatar.png')
        end
    end
end

