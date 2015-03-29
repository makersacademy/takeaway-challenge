require 'restaurant'

describe Restaurant do

  let(:mcmuffin) { double :mcmuffin, name: "mcmuffin", price: 1.99 }
  let(:big_mac) { double :big_mac, name: "big mac", price: 2.99 }
  let(:mcdonalds) { described_class.new(mcmuffin, big_mac) }

  it 'takes menu items on initialization' do
    expect { described_class.new("hash brown") }.not_to raise_error
  end

  it 'displays its menu items as a string when asked' do
    expect(mcdonalds.show_menu).to eq "1. mcmuffin - £1.99\n2. big mac - £2.99"
  end

  it 'receives an order and confirms via sms' do
    food_order = { items: [[1, 1], [2, 2]], total: 7.97, customer: :customer }
    hsh = { customer: :customer }
    expect(mcdonalds).to receive(:send_sms).with(hash_including(hsh)) do
      'success'
    end
    mcdonalds.receive_order(food_order)
  end

  it 'receives an order and responds with error if total is incorrect' do
    order = { items: [[1, 1], [2, 2]], total: 7.96 }
    expect { mcdonalds.receive_order(order) }.to raise_error "wrong total"
  end
end