class PostsController < ApplicationController
    
    before_action :find_post, only: [:edit, :show, :update, :destroy]
    before_action :authenticate_user!
    
    def index
        @posts = Post.where(user_id: current_user).order("created_at DESC")
    end
    
    def new
        @post = current_user.posts.build
        @pros = Pro.all
    end
    
    def show
        @comments = Comment.where(post_id: @post.id).order("created_at DESC")
        if @comments.blank?
            @avg_rating = 0
        else
            @avg_rating = @comments.average(:rating).round(2)
        end
    
    end
    
    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end
    
    def edit
        @pros = Pro.all
        @comment = Comment.where(post_id: @post.id).order("created_at DESC")
    end
    
    def update
        if @post.update(post_params)
            redirect_to @post
        else 
            render 'edit'
        end
    end
    
    def destroy 
        @post.destroy
        redirect_to root_path
    end
        
    
    private
    
    def find_post
         @post = Post.find(params[:id])
    end
    
    def post_params
        params.require(:post).permit(:title, :content, :pro_id, :rating)
    end
    
end
