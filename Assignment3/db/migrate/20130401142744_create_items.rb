class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :productName
      t.string :price
      t.string :urlImage
      t.string :description

      t.timestamps
    end
  end
end
