class RecordAddress
    include ActiveModel::Model
    attr_accessor :user_id, :product_id, :postcode, :prefecture, :municipality, :address, :buildingname, :phonenumber, :record_id

    with_options presence: true do
        validates :user_id
        validates :pruduct_id
        validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
        validates :municipality
        validates :address
        validates :phonenumber
    end
    validates :prefecture, numericality: numericality: { other_than: 1, message: 'Select'}


    def save
        record = Record.create(user_id: user_id, product_id: product_id)
        Address.create(postcode: postcode, prefecture: prefecture, municipality: municipality, address: address, buildingname: buildingname, phonenumber: phonenumber, product_id: product.id)
    end
  end

end