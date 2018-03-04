require 'order'

describe Order do
  subject(:order) { described_class.new() }
  let(:menu) { { "steak" => 12, "pasta" => 7, "fish" => 9 } }

  it 'starts with empty basket' do
    expect(order.basket).to eq []
  end

  it 'starts with total at zero' do
    expect(order.total).to eq 0
  end

  it 'raises error if customer selects unavailable dish' do
    expect { order.add_to_basket("curry", 1) }.to raise_error("Sorry, curry is not in the menu")
  end

  it 'allows customer to select number of dishes and add them to basket' do
    order.add_to_basket("pasta", 1)
    expect(order.basket).to eq ["pasta", 1]
  end

  it "shows customer the total amount owed after summing up items in basket" do
    order.add_to_basket("steak", 1)
    order.add_to_basket("pasta", 1)
    expect(order.total).to eq(19)
  end
end
