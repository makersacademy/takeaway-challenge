require 'restaurant'

describe Restaurant do
  it 'takes menu items on initialization' do
    expect { described_class.new("hash brown") }.not_to raise_error
  end

  it 'displays its menu items as a string when asked' do
    mcmuffin = double :mcmuffin, name: "mcmuffin", price: 1.99
    big_mac = double :big_mac, name: "big mac", price: 2.99
    mcdonalds = described_class.new(mcmuffin, big_mac)
    expect(mcdonalds.show_menu).to eq "1. mcmuffin - £1.99\n2. big mac - £2.99"
  end
end