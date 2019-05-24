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
  let(:order_class) { double(:order, new: order) }
  let(:order) { double(:order, delivery_time: "18:01").as_null_object }
  let(:takeaway) { Takeaway.new(dishes, order_class)}

  describe '#dishes' do
    it 'prints a friendly list of dishes' do
      expect(takeaway.dishes).to eq("Pizza: £1.50\nSushi: £16.00\n")
    end
  end

  describe '#order' do
    context 'ordering one item with the correct total' do
      it 'creates a new order' do
        expect(order_class).to receive(:new)
        takeaway.order("Pizza *1", 1.50)
      end

      it 'calls the add method on the order, with the correct dish object' do
        expect(order).to receive(:add).with(pizza)
        takeaway.order("Pizza *1", 1.50)
      end

      it 'returns a friendly string' do
        expected_output = "Thank you! Your order was placed and will be delivered before 18:01. You will also receive a text message with these details"
        expect(takeaway.order("Pizza *1", 1.50)).to eq(expected_output)
      end

      it 'sends a text message' 

    end

    context 'ordering one item with the incorrect total'

    context 'ordering multiple items with the correct total'

    context 'ordering multiple items with the incorrect total'

  end

end