require 'Order.rb'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double() }

  context '#add_dish' do
    it 'stores selected dishes and quantities' do
      order.add_dish("Pizza", 2)
      expect(order.dishes).to include({ :name => "Pizza", :amount => 2 })
    end
  end
end
