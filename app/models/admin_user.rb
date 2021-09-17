class AdminUser < ApplicationRecord
  devise :database_authenticatable,
         :rememberable,
         :validatable

  has_many :products, dependent: :restrict_with_error

  validates :name,
            presence: true,
            length: { maximum: 20 }
  validates :role,
            presence: true

  enum role: %i(owner staff)
end
