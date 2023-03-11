class MicropostsController < ApplicationController
    before_action :set_micropost, only: %i[show edit update destroy]

    def index
        @microposts = Micropost.all.order(:user_id)
    end

    def new
        @micropost = Micropost.new
    end

    def create
        @micropost = Micropost.new(micropost_params)
        if @micropost.save 
            redirect_to microposts_path, notice: 'Micropost has been created successfully.'
        else
            render :new
        end
    end

def show 
end

def edit 
end

def update
    if @micropost.update(micropost_params)
        redirect_to microposts_path, notice: 'Micropost has been updated successfully.'
    else
        render :edit
    end
end

def destroy
    @micropost.destroy
    redirect_to microposts_path, notice: 'Micropost has been deleted successfully.'
end


private

    def micropost_params
        params.require(:micropost).permit(:content, :user_id)
    end

    def set_micropost
        @micropost = Micropost.find(params[:id])
    end
end