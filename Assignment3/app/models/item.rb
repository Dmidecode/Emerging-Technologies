class Item < ActiveRecord::Base
  attr_accessible :description, :price, :productName, :urlImage

  validates :productName, :presence => true,
  			:length => { :maximum => 50 }

  validates :urlImage, :description, :presence => true

  validates :price, :presence => true, 
  			:numericality => { :greater_than_or_equal_to => 0 }

end
