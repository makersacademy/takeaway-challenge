require 'order'

describe Order do
  let(:menu) { Menu.new }
  let(:dish) { { name:'Burger', price: 8 } }

  describe '#initialize' do
    it 'order initializes as blank' do
      expect(subject.ordered_items.length).to eq 0
    end
  end

  describe '#add_to_order' do
    it 'adds dish to the order' do
      expect { subject.add_dish(dish, 1) }.to change { subject.ordered_items.length }.by(1)
    end
  end
end