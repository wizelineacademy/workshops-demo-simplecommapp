class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description
      t.integer :price, null: false
      t.integer :quantity, default: 0

      t.references :category, index: true

      t.timestamps
    end
  end
end
