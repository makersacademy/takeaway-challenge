require 'takeaway'

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

end
