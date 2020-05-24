require 'order'

describe Order do
  let(:menu) { double :menu }
  subject(:order) { described_class.new(menu) }
  let(:dish) { "marinara" }
  it 'initialises a @items empty hash to store the list of ordered dishes' do
    expect(subject.items).to eq({})
    expect(subject.menu).not_to be(nil)
  end

  it 'add the dishes to the list of items' do
    subject.add_dish("marinara", 2)
    subject.add_dish("marinara", 2)
    subject.add_dish("calzone")
    expect(subject.items).to eq({ "marinara" => 4, "calzone" => 1 })
  end

  it 'return price for a specific dish' do
    allow(menu).to receive(:dishes).and_return({ "marinara" => 5 })
    expect(subject.get_price(dish)).to eq(5)
  end

  it 'returns total price of the order' do
    allow(menu).to receive(:dishes).and_return({ "marinara" => 5, "calzone" => 8})
    subject.add_dish("marinara", 2)
    subject.add_dish("calzone")
    expect(subject.get_total_price).to eq(18)
  end
end
