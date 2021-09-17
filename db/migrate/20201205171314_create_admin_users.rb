class CreateAdminUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_users do |t|
      t.string :name
      t.integer :role, default: 1

      t.timestamps
    end
  end
end
