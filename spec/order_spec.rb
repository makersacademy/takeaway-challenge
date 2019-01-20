require 'order'

describe Order do
subject(:order) { described_class.new(menu) }

let(:menu) { double(:menu) }

let(:dishes) do
  {
    starter: 2,
    main: 1
  }
end

before do
  allow(menu).to receive(:has_dish?).with(:starter).and_return true
  allow(menu).to receive(:has_dish?).with(:main).and_return true
end

it "selects dishes from the menu" do
  order.add(:starter, 2)
  order.add(:main, 1)
  expect(order.dishes).to eq(dishes)
end

it 'doesnt allow non-existent dishes to be ordered' do
  allow(menu).to receive(:has_dish?).with(:wine).and_return false
  expect { order.add(:wine, 2) }.to raise_error "There is no wine"
end
end
