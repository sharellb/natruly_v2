class CreateSalons < ActiveRecord::Migration
  def change
    create_table :salons do |t|
      t.string :address
      t.string :name
      t.text :description
      t.string :website
      t.string :phone_number

      t.timestamps
    end
  end
end
