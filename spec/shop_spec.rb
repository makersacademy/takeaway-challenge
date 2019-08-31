require 'shop'

describe Shop do
  subject(:shop) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, view: viewed_menu) }
  let(:viewed_menu) { "Menu" }


  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it "display a menu with dishes and prices" do
    expect(shop.view_menu).to eq(viewed_menu)
  end
end
