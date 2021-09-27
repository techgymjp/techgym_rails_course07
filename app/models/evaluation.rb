class Evaluation < ApplicationRecord
  belongs_to :product,
             foreign_key: 'product_id'

  validates :body,
            length: { maximum: 800 },
            presence: true
  validates :rate,
            numericality: {
              greater_than_or_equal_to: 1,
              less_than_or_equal_to: 5,
              only_integer: true,
            },
            presence: true
  validates :title,
            length: { maximum: 15 },
            presence: true

  NG_WORD = %w( ワード1 ワード2 ワード3 ).freeze
  validate :disallow_ng_word

  private

  def disallow_ng_word
    errors.add(:body, 'に使用禁止ワードが含まれています') if NG_WORD.any? { |ng_word| body.include?(ng_word) }
  end
end
