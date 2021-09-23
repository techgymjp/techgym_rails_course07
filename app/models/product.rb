class Product < ApplicationRecord
  belongs_to :admin_user
  belongs_to :category
  belongs_to :origin,
             class_name: 'Product',
             optional: true

  has_one_attached :image
  has_many :copied_product,
           dependent: :destroy,
           class_name: 'Product',
           foreign_key: 'origin_id'

  validates :description,
            presence: true,
            length: { maximum: 1000 }
  validates :title,
            presence: true,
            length: { maximum: 20 }

  validate :deny_copied_product_to_have_product
  validate :image_size,
           :image_type

  private

  def deny_copied_product_to_have_product
    errors.add(:origin_id, 'は存在してはいけません') if origin_id.present? && origin.origin_id.present?
  end

  def image_size
    return if !image.attached?

    if image.byte_size > 10.megabytes
      image.purge
      errors.add(:image, 'ファイルのサイズは10MB以内にしてください')
    end
  end

  def image_type
    return if !image.attached?
    allowed_types = %w( image/jpeg image/jpg image/png )

    if !image.content_type.in?(allowed_types)
      image.purge
      errors.add(:image, 'ファイルはjpeg、jpg、pngのいずれかの形式で添付してください')
    end
  end
end
