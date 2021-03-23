class RecordsController < ApplicationController
    
    def index
        @product = Product.find(params[:product_id])
        @record_address = RecordAddress.new
    end

    def create
        @product = Product.find(params[:product_id])
        @record_address = RecordAddress.new(record_params)
        if @record_address.valid?
            @record_address.save
            redirect_to root_path
        else
            render :index
        end
    end

    private
    def record_params
        params.require(:record_address).permit(:postcode, :prefecture_id, :municipality, :address, :buildingname, :phonenumber).merge(user_id: current_user.id, product_id: params[:product_id])
    end

end
