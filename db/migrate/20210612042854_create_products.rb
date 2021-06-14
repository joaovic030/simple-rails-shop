class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.text :name
      t.references :brand, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.decimal :price
      t.text :image_url
      t.text :for
      t.text :desc1
      t.text :desc2

      t.timestamps
    end
  end
end
