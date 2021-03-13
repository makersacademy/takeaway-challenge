require 'order'

describe Order do
  describe '#select_dishes' do
    # it 'accepts user input' do
    #   order = Order.new
    #   allow(order).to receive(:gets).and_return("MexiCali Beef Burger")
    #   expect(order.select_dishes).to eq ["MexiCali Beef Burger"]
    # end
    it 'stores the order in an array' do
      order = Order.new
      allow(order).to receive(:gets).and_return("MexiCali Beef Burger")
      order.select_dishes
      expect(order.whole_order).to eq ["MexiCali Beef Burger ---> 12"]
    end
    # it 'compares the order to the list of dishes and returns them order with prices' do
    #   order = Order.new
    #   allow(order).to receive(:gets).and_return("MexiCali Beef Burger")
    #   order.select_dishes
    #   expect(order.return_order).to eq ["MexiCali Beef Burger ---> 12"]
    # end

    #At the moment - This test is irrelevan. It passes even though the method does something different
  end
end
