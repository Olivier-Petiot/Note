class CommentsController < ApplicationController
    
    before_action :find_comment, only: [:edit, :update, :destroy]
    
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(post_params)
        @comment.user_id = current_user.id if current_user
        if @comment.save
            redirect_to post_path(@post)
        else
            render 'new'
        end
    end
    
    def destroy
        @comment.destroy
        redirect_to  post_path(@post)
    end
    
    def edit
    end
    
    def update
        if @comment.update(post_params)
            redirect_to post_path(@post)
        else
            render 'edit'
        end
    end
    
    private
    
    def post_params
        params.require(:comment).permit(:comment, :rating)
    end
    
    def find_comment
        @post = Post.find(params[:post_id])        
        @comment = @post.comments.find(params[:id])
    end
end
