require 'takeaway'

describe Takeaway do

subject(:takeaway) { described_class.new }

  describe '#initialize' do
    it 'contains a menu' do
      expect(takeaway.menu).not_to be_nil
    end
  end

  describe '#complete_order' do
    it 'sends a confirmation message to the customer' do
      expect(takeaway.complete_order(19.0)).to eq("Thank you! Your order total of £19.0 was placed and will be delivered before #{takeaway.delivery_time}")
    end
  end

end
