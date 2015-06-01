class ProController < ApplicationController
    
    before_action :find_pro, only: [:edit, :show, :update, :destroy]
    before_action :authenticate_user!
    
    def index
        @pros = Pro.all.order("name DESC")
    end
    
    def new
    end
    
    def show
    end
    
    def create
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy 
    end
        
    
    private
    
    def find_pro
        @pro = Pro.find(params[:id])
    end
    
    def pro_params
        params.require(:pro).permit(:name)
    end
    
end
