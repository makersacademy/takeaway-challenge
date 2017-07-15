require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:dish1) { { "Green Curry" => 2 } }
  let(:dish) { "Green Curry" }
  let(:quantity) { 2 }
  let(:total) { 1 }

  it 'should add dishes to the order' do
    order.add_dish([dish, quantity, 2])
    expect(order.dishes).to eq dish1
  end

  it 'raises an error if order total does not match number of dishes' do
    expect { order.add_dish([dish, quantity, total]) }.to raise_error "The total of #{total} does not appear to match the sum of dishes ordered."
  end

  #   dishes_hash = { "Green Curry" => 6, "Massaman Curry" => 6,
  #                 "Panang Curry" => 6, "Pad Thai" => 7,
  #                 "Rice" => 2, "Pad Pak" => 3,
  #                 "Singha" => 4 }
  #   expect(thai.dishes).to eq dishes_hash
  # end
end
