require 'takeaway'

describe Takeaway do

  menu = [
          {name: 'Bolognese', price: 6},
          {name: 'Pizza', price: 8},
          {name: 'Chips', price: 2},
          {name: 'Chicken', price: 3},
          {name: 'Hamburger', price: 4},
          {name: 'Donner Wrap', price: 6},
          {name: 'Nuggets', price: 3},
          {name: 'Mozzarella Sticks', price: 5},
          {name: 'Deep-fried Mars Bar', price: 1},
          {name: 'Fish', price: 5}
        ]

  describe '#menu' do
    it 'prints list of food items with prices' do
      expect(subject.menu).to eq menu
    end
  end

  describe "#choose" do
    it 'adds 3 pizza to order instance variable' do
      subject.choose('pizza', 3)
      expect(subject.order).to include({name: 'Pizza', price: 8, quantity: 3})
    end
    it 'raises error when trying to choose non existent item' do
      expect{subject.choose('grapes')}.to raise_error 'Please choose something from the menu'
    end
  end

  describe "checking totals" do
    before{subject.choose('pizza', 3)}
    before{subject.choose('donner', 2)}
    before{subject.choose('nuggets', 5)}

    describe "#order" do
      it 'calculates total of 51 when passed an order' do
        expect(subject.order).to include(total: 51)
      end
    end

    describe "#sum" do
      it 'gets sum of order, should be 51' do
        expect(subject.sum).to eq 51
      end
    end

    describe "#check_sum" do
      it 'raises error if sum does not match up with check sum' do
        expect{subject.check_sum(32)}.to raise_error "Sum is not correct!"
      end

      it 'returns true when total matches up with check_sum' do
        expect(subject.check_sum(subject.order[0][:total])).to eq true
      end
    end
    
  end

end