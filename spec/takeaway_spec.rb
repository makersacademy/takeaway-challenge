require 'takeaway'

describe Takeaway do

  context 'Menu' do
  let(:takeaway) { described_class.new }

    it 'Should be able to call #read_menu method from Menu' do
      expect(takeaway).to respond_to(:read_menu)
    end
    it 'Should be able add items from menu to basket' do
      expect{takeaway.order("Pizza")}.to change{takeaway.basket.size}.by(1)
    end
    it 'Should raise an error if item not on menu' do
      expect{takeaway.order("test")}.to raise_error "Item not available"
    end
  end

end
