require 'basket'

describe Basket do
  let(:dish1) { double('Dish', name: 'Guacamole Deep', price: 269) }
  let(:dish2) { double('Dish', name: 'Not Yo Cheese', price: 399) }
  let(:menu) { double('Menu', selection: [dish1, dish2]) }
  
  context 'Given that a menu selection is added' do
    before(:each) { subject.add(menu) }

    it 'should allow the addition of menu selections' do
      expect(subject.contents).to eq([dish1, dish2])
    end

    it 'should return an itemised list of contents' do
      expect(subject.itemise).to eq("1 x Guacamole Deep @ £2.69 each
1 x Not Yo Cheese @ £3.99 each\n")
    end
  end
end