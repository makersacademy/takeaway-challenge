require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }

  let(:dishes) do
    {
      edamame: 2,
      salmon_roll: 1
    }
  end

before do
  allow(menu).to receive(:has_dish?).with(:edamame).and_return(true)
  allow(menu).to receive(:has_dish?).with(:vegetable_spring_roll).and_return(true)
  allow(menu).to receive(:has_dish?).with(:salmon_roll).and_return(true)

  allow(menu).to receive(:price).with(:edamame).and_return(2.45)
  allow(menu).to receive(:price).with(:vegetable_spring_roll).and_return(4.80)
  allow(menu).to receive(:price).with(:salmon_roll).and_return(3.80)
end

  it 'can order some number of several available dishes' do
  order.add(:edamame, 2)
  order.add(:salmon_roll, 1)
  expect(order.dishes).to eq(dishes)
  end

  it 'doesn/t allow items to be added that are not on the menu' do
    allow(menu).to receive(:has_dish?).with(:tuna).and_return(false)
   expect { order.add(:tuna, 3) }.to raise_error NoItemError, "Tuna is not on the menu!"
end

 it 'calculates total for the order' do
   order.add(:edamame, 2)
   order.add(:salmon_roll, 1)
   total = 8.70
   expect(order.total).to eq(total)

 end
end
