class Product < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :delivery_fee
    belongs_to :delivery_day
    belongs_to :user
    has_one_attached :image

    # validates :category_id, numericality: { other_than: 1 }
    # validates :status_id, numericality: { other_than: 1 } 
    # validates :delivery_fee_id, numericality: { other_than: 1 } 
    # validates :delivery_day_id, numericality: { other_than: 1 } 
    with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :status_id
        validates :delivery_fee_id
        validates :prefecture_id
        validates :delivery_day_id
    end
end
