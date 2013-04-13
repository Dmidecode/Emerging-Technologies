require 'spec_helper'

describe Item do
	before(:each) do
 	@attr = {
      :productName => "Product Name",
      :price => 42,
      :urlImage => "url Example",
      :description => "description"
    }
  end

  it "Must put a product name, price, and url and a description to valid the item" do
    Item.create!(@attr)
  end

	it "must require a product name" do   
    bad_name = Item.new(@attr.merge(:productName => ""))
    bad_name.should_not be_valid
  end

  it "must require a price" do
  	price = -1
  	bad_price = Item.new(@attr.merge(:price => price))
  	bad_price.should_not be_valid
  end

  it "reject product too long" do
  	long_name = "a" * 51
  	long_name_item = Item.new(@attr.merge(:productName => long_name))
  	long_name_item.should_not be_valid
  end

  it "must require an url" do   
    bad_url = Item.new(@attr.merge(:urlImage => ""))
    bad_url.should_not be_valid
  end


  it "must require a description" do   
    bad_description = Item.new(@attr.merge(:description => ""))
    bad_description.should_not be_valid
  end


end
