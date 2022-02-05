require 'takeaway'
require 'order'

describe Takeaway do

  dishes = [{pizza: '£9'}, {pasta: '£7'}]
  subject(:takeaway) { described_class.new(dishes) }

  describe '#menu' do
    it 'shows a list of all the dishes and their prices' do 
      expect(subject.menu).to eq dishes
    end
  end

  describe '#add_to_order' do
    it 'adds the given dish to the cuurrent order' do
      subject.add_to_order("pizza")
      expect(subject.order).to include pizza: "£9"
    end
  end

  describe '#total' do
    it 'calculates the total sum of the dishes in an order' do
      subject.add_to_order("pizza")
      subject.add_to_order("pasta")
      expect(takeaway.total).to eq 16
    end
  end

end
