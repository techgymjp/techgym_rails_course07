class Product < ApplicationRecord
  belongs_to :admin_user
  belongs_to :category

  has_one_attached :image

  validates :description,
            presence: true,
            length: { maximum: 1000 }
  validates :title,
            presence: true,
            length: { maximum: 20 }

  validate :image_size,
           :image_type

  private

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
