class Product < ApplicationRecord
  belongs_to :admin_user
  belongs_to :category

  validates :description,
            presence: true,
            length: { maximum: 1000 }
  validates :title,
            presence: true,
            length: { maximum: 20 }
end
