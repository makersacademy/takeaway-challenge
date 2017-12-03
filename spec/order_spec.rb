require './lib/order.rb'

describe Order do
  subject(:order) { described_class.new }
  let(:item) { { dish: 'food', price: 5 } }

  before do
    order.order_item(item)
  end

  context '#order_item' do
    it "Should put ordered item into order" do
      expect(order.ordered_items).to include item
    end
  end

  context '#order_total' do
    it "Should calculate the correct price of all the dishes ordered" do
      expect(order.order_total).to eq 5
    end
  end

  context '#order_view' do
    it "Should display the ordered items so far" do
      expect{order.order_view}.to output("food :: price - £5\n").to_stdout
    end
  end
  
end
