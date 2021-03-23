class RecordsController < ApplicationController
    
    def index
        @product = Product.find(params[:product_id])
        @record_address = RecordAddress.new
        # binding.pry
    end

    def create
        binding.pry
    end

    private
    def record_params
        params.require(:record_address).permit(:postcode, :prefecture_id, :municipality, :address, :buildingname, :phonenumber).merge(user_id: current_user.id, product_id: params[:product_id])
    end

end
