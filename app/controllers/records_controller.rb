class RecordsController < ApplicationController
    
    def index
        @product = Product.find(params[:product_id])
        @record_address = RecordAddress.new
    end

    def create
    end

end
