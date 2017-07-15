require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:dish1) { { "Green Curry" => 2 } }
  let(:dish) { "Green Curry" }
  let(:quantity) { 2 }
  it { is_expected.to respond_to(:add_dish).with(2).argument }

  it 'should add dishes to the order' do
    order.add_dish(dish, quantity)
    expect(order.dishes).to eq dish1
  end

  #   dishes_hash = { "Green Curry" => 6, "Massaman Curry" => 6,
  #                 "Panang Curry" => 6, "Pad Thai" => 7,
  #                 "Rice" => 2, "Pad Pak" => 3,
  #                 "Singha" => 4 }
  #   expect(thai.dishes).to eq dishes_hash
  # end
end
