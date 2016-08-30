require 'order.rb'

describe Order do

  subject(:order) { Order.new }

  context '#add_to_order' do
    it 'allows users to specify the dish and quantity needed' do
      expect(order).to respond_to(:add_to_order).with(2).arguments
    end
    it 'adds the users selections to the order_list' do
      order.add_to_order('chicken', 3)
      expect(order.order_list).to include(:dish=>"chicken", :quantity=>3)
    end
  end


end
