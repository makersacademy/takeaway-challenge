require 'customer'

describe Customer do

  it 'takes an options hash on initialisation' do
    expect { described_class.new(options: "hash") }.not_to raise_error
  end

  it 'can view a menu' do
    restaurant = double :restaurant, show_menu: "1. Big Mac - £3.99"
    customer = described_class.new(options: "hash")
    expect(customer.view_menu(restaurant)).to eq "1. Big Mac - £3.99"
  end
end
