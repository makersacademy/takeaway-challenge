require 'order'
require 'dish'

describe Order do
  let(:order) { Order.new }
  let(:mapotofu) { double :dish, :name => "Mapo Tofu", :price => 5.0 }
  let(:gongbaotofu) { double :dish, :name => "Gongbao Tofu", :price => 4.5 }
  # mapotofu = Dish.new('Mapo Tofu', 5.00)
  
  describe '#add' do
    it 'adds a dish to an order' do
      order.add(mapotofu)
      expect(order.order_dishes).to eq([mapotofu])
    end
  end

  describe '#print_receipt' do
    it 'prints a receipt with total' do
      order.add(mapotofu)
      # allow(mapotofu).to receive(:name) { "Mapo Tofu" }
      expect(order.print_receipt).to eq("Order:\nMapo Tofu - 5.00\nTotal: £5.00")
    end

    it 'prints a receipt with multiple dishes with total' do
      order.add(mapotofu)
      order.add(gongbaotofu)
      expect(order.print_receipt).to eq("Order:\nMapo Tofu - 5.00\nGongbao Tofu - 4.50\nTotal: £9.50")
    end
  end
end