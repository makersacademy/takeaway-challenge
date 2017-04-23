require 'ordermanagement'

describe OrderManagement do
  let(:ordermanagement) { described_class.new }
  order = [:test_dish, 1]
  describe '#place' do
    it 'creates new orders' do
      ordermanagement.place(order)
      expect(ordermanagement.new_orders[0].order_details.keys).to include order[0]
    end
  end
end
