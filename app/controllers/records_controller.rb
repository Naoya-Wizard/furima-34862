class RecordsController < ApplicationController
    before_action :authenticate_user!
    before_action :move_to_index

    def index
        @product = Product.find(params[:product_id])
        @record_address = RecordAddress.new
    end

    def create
        @product = Product.find(params[:product_id])
        @record_address = RecordAddress.new(record_params)
        if @record_address.valid?
            pay_item
            @record_address.save
            redirect_to root_path
        else
            render :index
        end
    end

    private
    def record_params
        params.require(:record_address).permit(:postcode, :prefecture_id, :municipality, :address, :buildingname, :phonenumber).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
    end

    def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @product.price,
          card: record_params[:token],
          currency:'jpy'
        )
     end

     def move_to_index
        @product = Product.find(params[:product_id])
        if current_user.id == @product.user.id || @product.record.present?
            redirect_to root_path
        end
    end

end
