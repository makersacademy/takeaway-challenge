require 'shop.rb'

describe Shop do

  subject( :shop ){ described_class.new }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "show a list of dishes with prices(Float)" do
    price = nil
    ( shop.menu ).each_value{ | value | price = value }
    expect( price ).to be_kind_of( Float )
  end

  it "take orders from customers" do
  end

end
