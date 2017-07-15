require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { {"Chicken burger":11}}
  let(:price) { 11 }

  it "returns a list of dishes" do
    expect(menu).to be_an_instance_of Hash
  end
  # it "expects to return the price of the dish" do
  #   @dish = ["Chicken Burger":11]
  #   expect(menu.price).to eq 11
  # end
  #
  # # context "dishes" do
  #   before {menu.store_dishes}
  #   it "stores dish in dishes array" do
  #     expect(menu.dishes).to include menu.dish{name:price}
  #   end
  # end
end
