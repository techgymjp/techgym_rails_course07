class AddOriginIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :origin_id, :bigint
    add_foreign_key :products, :products, column: :origin_id
  end
end
