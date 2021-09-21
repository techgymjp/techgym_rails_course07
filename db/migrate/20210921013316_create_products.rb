class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :admin_user, foreign_key: true
      t.references :category, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
