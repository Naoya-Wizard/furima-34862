class ProductsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    before_action :move_to_index, only: [:edit, :update, :destroy]

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
    end

    def edit
    end

    def update
        if @product.update(product_params)
            redirect_to product_path(@product)
        else
            render :edit
        end
    end

    def destroy
        @product.destroy
        redirect_to root_path
    end

    private

    def product_params
        params.require(:product).permit(:image, :name, :description, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
    end

    def set_product
        @product = Product.find(params[:id])
    end

    def move_to_index
        unless current_user.id == @product.user.id
            redirect_to root_path
        end
    end
end
