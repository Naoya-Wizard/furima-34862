class ProductsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @product = Product.includes(:user).order("created_at DESC")
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to root_path
        else
            render :new
        end
    end

    def show
        @product = Product.find(params[:id])
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to product_path(@product)
        else
            render :edit
        end
    end

    private

    def product_params
        params.require(:product).permit(:image, :name, :description, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
    end
end
