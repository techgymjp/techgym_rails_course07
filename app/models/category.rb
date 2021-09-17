class Category < ApplicationRecord
  has_many :product,
           dependent: :restrict_with_error

  validates :name,
            presence: true,
            uniqueness: true,
            length: { maximum: 20 }
end
