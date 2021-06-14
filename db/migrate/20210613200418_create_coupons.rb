class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.text :description
      t.boolean :activated
      t.date :expired_date
      t.integer :percentage
      t.text :token

      t.timestamps
    end
  end
end
