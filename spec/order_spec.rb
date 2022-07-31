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

  describe '#display_order' do
    it 'expects the ordered items to be returned' do
      subject.add_dish(dish[:name])
      expect(subject.display_order).to eq dish
    end
  end

  describe '#total_cost' do
    it 'returns the total cost of the order' do
      subject.add_dish(dish[:name])
      expect(subject.total_cost).to eq "Total cost £#{dish[:price]}"
    end
  end
end