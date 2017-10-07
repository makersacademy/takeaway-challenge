require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  # let(:dishes) { double(:dishes, name: "Chop Suey", price: 15.99) }

  describe "showing dishes" do
    it 'returns the menu list' do
      expect(takeaway.menu).to be_instance_of Dishes
    end

# { name: name, price: "£#{price}" }
  end

end
