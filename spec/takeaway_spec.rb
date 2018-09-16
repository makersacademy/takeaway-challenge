require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new({ sms: sms }) }
  let(:sms) { double :sms }
  let(:dish_1) { double :dish, :name => 'steamed pork dumpling', :price => 1.50 }
  let(:dish_2) { double :dish, :name => 'spare ribs', :price => 4.50 }
  let(:dish_3) { double :dish, :name => 'prawn crackers', :price => 1 }

  describe '#dishes' do
    it 'should allow dishes on the menu to be seen' do
      expect(takeaway.dishes).to be_an(Array)
    end
  end

  describe '#select_dish' do
    it 'should add the quantity of the selected dish to the order' do
      quantity = 2
      expect(takeaway.select_dish(dish_1, quantity)).to eq(
        "#{quantity} * #{dish_1.name} = £#{dish_1.price}"
      )
    end
  end

  describe '#total_price' do
    it 'should calculate the total price of the order' do
      takeaway.select_dish(dish_1, 2)
      takeaway.select_dish(dish_2, 1)
      takeaway.select_dish(dish_3, 3)
      expect(takeaway.total_price).to eq((dish_1.price * 2) + dish_2.price + (dish_3.price * 3))
    end
  end
end
