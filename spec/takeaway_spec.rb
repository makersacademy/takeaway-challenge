require 'takeaway'

describe 'takeaway' do

  let(:pizza) { double(:dish, name: "Pizza", price: BigDecimal(1.51, 4), to_s: "Pizza: £1.50") }
  let(:sushi) { double(:dish, name: "Sushi", price: BigDecimal(16, 4), to_s: "Sushi: £16.00") }
  let(:dishes) do
    {
      "Pizza" => pizza,
      "Sushi" => sushi
    }
  end
  let(:menu) { double(:menu) }
  let(:menu_class) { double(:menu, new: menu)}
  let(:order_class) { double(:order, new: order) }
  let(:order) { double(:order, delivery_time: "18:01").as_null_object }
  let(:order_handler) { double(:order_handler) }
  let(:order_handler_class) { double(:order_handler, new: order_handler) }
  let(:takeaway) { Takeaway.new(dishes, order_class, menu_class, order_handler_class)}



  describe '#dishes' do
    it 'calls list on menu' do
      expect(menu).to receive(:list)
      takeaway.dishes
    end
  end

  describe '#order' do
    it 'calls handle_order on order_handler with order string' do
      expect(order_handler).to receive(:handle_order).with("Pizza *1", 17.50)
      takeaway.order("Pizza *1", 17.50)
    end

    it 'passes through the return value from handle_order' do
      allow(order_handler).to receive(:handle_order).and_return('Return string')
      expect(takeaway.order("Order String", 1)).to eq("Return string")
    end
  end
end