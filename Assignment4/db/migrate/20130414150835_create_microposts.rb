class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :title
      t.text :content
      t.string :tags

      t.timestamps
    end
  end
end
