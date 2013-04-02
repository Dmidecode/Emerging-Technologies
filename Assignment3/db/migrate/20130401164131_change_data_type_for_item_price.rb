class ChangeDataTypeForItemPrice < ActiveRecord::Migration
	def self.up
    change_table :items do |t|
      t.change :price, :float
    end
  end
 
  def self.down
    change_table :items do |t|
      t.change :count, :string
    end
  end
end
