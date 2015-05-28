class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :find_post, only: [:show]
    before_action :find_note, only: [:show]
    
    def index
        @notes = Note.where(user_id: current_user).order("created_at DESC")
        @posts = Post.where(user_id: current_user).order("created_at DESC")
    end
    
    private
    
    def find_post
        @post = Post.find(params[:id])
        @note = Note.find(params[:id])
    end

end