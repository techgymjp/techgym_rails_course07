class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.references :product, foreign_key: true
      t.integer :rate, null: false
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end