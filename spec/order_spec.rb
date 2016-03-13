require 'order'

describe Order do
  subject(:order) {described_class.new}
  let(:menu) {double :menu}

  describe '#initialize'do
    it 'should start with an empty order list' do
      expect(order.list).to be_empty
    end

    it 'should start with an empty sub total list' do
      expect(order.sub_total).to be_empty
    end
  end

  describe '#view_menu' do
    it 'show the contents of a menu' do
      contents = {
        'Meat Biriyani' => 8,
        'Ocotopus Vindaye' => 5,
        'Broad beans curry and dal pouri' => 5,
        'Rougaye eggs' => 6,
        'Gateau Pima' => 3,
        'Chicken noodles' => 7
      }
      allow(menu).to receive(:view_contents).and_return(contents)
      expect(order.view_menu).to eq menu.view_contents
    end
  end

  describe '#pick' do
    it 'stores order ' do
      order.pick('Meat Biriyani',3)
      expect(order.list).to include('Meat Biriyani' => 3)
    end

    context 'edge cases' do
      it 'stores orders of 1 if no amount given' do
        order.pick('Meat Biriyani')
        expect(order.list).to include('Meat Biriyani' => 1)
      end

      it 'raises error when item is not on menu' do
        message = 'The dish is not on the menu'
        expect{order.pick('chips', 2)}.to raise_error message
      end

      it 'increases number of dishes already picked' do
        order.pick('Meat Biriyani',4)
        order.pick('Meat Biriyani',2)
        expect(order.list['Meat Biriyani']).to eq 6
      end
    end
  end

  describe '#sub_total_orders' do
    it 'returns list of each dish, amount and total cost' do
      order.pick('Meat Biriyani', 3)
      order.pick('Rougaye eggs', 1)
      order.pick('Ocotopus Vindaye', 5)
      list = {'Meat Biriyani' => [3,24],
              'Rougaye eggs' => [1,6],
              'Ocotopus Vindaye' => [5,25]
            }
      order.sub_total_orders
      expect(order.sub_total).to eq list
    end
  end

  describe '#total_cost' do
    it 'returns combined total of all orders' do
      order.pick('Meat Biriyani', 3)
      order.pick('Rougaye eggs', 1)
      order.pick('Ocotopus Vindaye', 5)
      order.sub_total_orders
      expect(order.total_cost).to eq 55
    end
  end

  describe '#remove' do
    it 'removes order not wanted' do
      order.pick('Meat Biriyani', 3)
      order.pick('Rougaye eggs', 1)
      order.pick('Ocotopus Vindaye', 5)
      order.remove('Meat Biriyani')
      expect(order.list).not_to include 'Meat Biriyani'
    end

    it 'raises error if order not placed' do
      order.pick('Meat Biriyani', 3)
      order.pick('Rougaye eggs', 1)
      order.pick('Ocotopus Vindaye', 5)
      message = "Chips not ordered"
      expect{order.remove('chips')}.to raise_error message
    end
  end

  describe '#change' do
    it 'changes the amount of an ordered dish ' do
      order.pick('Meat Biriyani', 3)
      order.pick('Rougaye eggs', 1)
      order.pick('Ocotopus Vindaye', 5)
      order.change('Meat Biriyani', 7)
      expect(order.list['Meat Biriyani']).to eq 7
    end

    it 'raises error if order not placed' do
      order.pick('Meat Biriyani', 3)
      order.pick('Rougaye eggs', 1)
      order.pick('Ocotopus Vindaye', 5)
      message = "Chips not ordered"
      expect{order.change('chips')}.to raise_error message
    end
  end
  describe '#reset' do
    it 'removes all orders' do
      order.pick('Meat Biriyani', 3)
      order.pick('Rougaye eggs', 1)
      order.pick('Ocotopus Vindaye', 5)
      order.reset
      expect(order.list).to be_empty
    end
  end

  describe '#confirm_order' do
    it 'sends a text to user confirming order' do

    end
  end

end
