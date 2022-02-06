require 'takeaway'
require 'order'

describe Takeaway do

  dishes = [{ pizza: '£9' }, { pasta: '£7' }]
  subject(:takeaway) { described_class.new(dishes) }

  describe '#menu' do
    it 'shows a list of all the dishes and their prices' do 
      expect(takeaway.menu).to eq dishes
    end
  end

  describe '#add_to_order' do
    it 'adds the given dish to the cuurrent order' do
      order = takeaway.new_order
      order.add_to_order("pizza")
      expect(order.list).to include pizza: "£9"
    end
  end

  describe '#new_order' do
    it 'creates a new instance of the Order class' do
      expect(takeaway.new_order.class).to eq (Order)
    end
  end

end
