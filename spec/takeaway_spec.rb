require 'takeaway'

describe 'takeaway' do

  let(:dishes) do
    {
      "Pizza" => double(:dish, name: "Pizza", price: BigDecimal(1.51, 4), to_s: "Pizza: £1.50"),
      "Sushi" => double(:dish, name: "Sushi", price: BigDecimal(16, 4), to_s: "Sushi: £16.00")
    }
  end
  let(:order_class) { double(:order, new: order) }
  let(:order) { double(:order) }
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

      it 'calls the add method on the order, with the correct dish object'

      it 'returns a friendly string'

      it 'sends a text message'

    end


  end

end