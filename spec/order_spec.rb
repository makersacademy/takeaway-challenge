require 'order'

describe Order do
  let(:order) { Order.new }
  describe '#initialize' do
    it 'creates an empty hash to store order summary' do
      expect(order.summary).to be_empty
    end
  end

# add method takes dish and quantity as arguments, adds them to the users order, and returns the current order list
# checkout method takes users name, phone number, address, sends a confirmation text, and returns the checkout summary including cost breakdown
# order method prints current order list
end
