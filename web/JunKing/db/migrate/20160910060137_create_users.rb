class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :recycled_product

      t.timestamps null: false
    end
  end
end
