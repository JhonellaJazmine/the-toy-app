class MicropostsController < ApplicationController
    before_action :set_micropost, only: %i[show edit update destroy]
    before_action :require_user_logged_in!
    
    def index
        @microposts = Micropost.all.order(:created_at)
        
        # if session[:user_id]
        #     @user = User.find(session[:user_id])
        # end
    end

    def new
        @micropost = Micropost.new
    end

    def create
        @micropost = Micropost.new(micropost_params)
        if @micropost.save 
            redirect_to microposts_path, notice: 'Micropost has been created successfully.'
        else
            render :new, status: 422
        end
    end

def show 
end

def edit 
    if @micropost.user != Current.user
        redirect_to microposts_path, notice: 'unauthorized access!'
     end
end

def update
    if @micropost.update(micropost_params)
        redirect_to microposts_path, notice: 'Micropost has been updated successfully.'
    else
        render :edit, status: 422
    end
end

def destroy
    if @micropost.user != Current.user
        redirect_to microposts_path, notice: 'unauthorized access!'
    else @micropost.destroy
    redirect_to microposts_path, notice: 'Micropost has been deleted successfully.'
    end
end


private

    def micropost_params
        params.require(:micropost).permit(:title, :content, :image, :user_id, additional_images: [])
    end

    def set_micropost
        @micropost = Micropost.find(params[:id])
    end

end