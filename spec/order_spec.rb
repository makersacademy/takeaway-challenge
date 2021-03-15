require 'order'

describe Order do
  describe '#select_dishes' do
    it 'accepts user input' do
      order = Order.new
      allow(order).to receive(:gets).and_return("MexiCali Beef Burger", "end order")
      expect(order.select_dishes).to eq ["MexiCali Beef Burger ---> 12"]
    end
    it 'stores the order in an array' do
      order = Order.new
      allow(order).to receive(:gets).and_return("MexiCali Beef Burger", "end order")
      order.select_dishes
      expect(order.whole_order).to eq ["MexiCali Beef Burger ---> 12"]
    end

    it 'prompts the user for inputs until "end order" entered' do
      order = Order.new
      allow(order).to receive(:gets).and_return("MexiCali Beef Burger",
                                                "The Burrito Burger",
                                                "El No Beef Burger",
                                                "end order")
      order.select_dishes
      expect(order.whole_order).to eq ["MexiCali Beef Burger ---> 12",
      "The Burrito Burger ---> 15", "El No Beef Burger ---> 15"]
    end
  end
  describe '#total' do
    it 'returns a total value of the order' do
      order = Order.new
      allow(order).to receive(:gets).and_return("The Burrito Burger", "end order")
      order.select_dishes
      expect(order.total).to eq [15]
    end
  end
  describe '#bill' do
    it 'returns a list of menu items with the total at the bottom' do
      order = Order.new
      allow(order).to receive(:gets).and_return("MexiCali Beef Burger",
                                                "The Burrito Burger",
                                                "El No Beef Burger",
                                                "end order")
      order.select_dishes
      expect { order.summarised_bill }.to output.to_stdout
    end
  end
end
