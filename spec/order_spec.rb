require 'order'

describe Order do
  describe '#initialize' do
    it 'creates an empty list' do
      expect(subject.list).to be_an(Array)
    end
  end

  describe '#add' do
    it 'adds dishes to the order' do
      order = Order.new
      order.add("Ramen")
      expect(order.list).to eq ["Ramen"]
    end
  end

  describe '#remove' do
    it 'removes a dish from the order' do
      order = Order.new
      order.add("Ramen")
      order.remove("Ramen")
      expect(order.list).to be_empty
    end
  end

  describe '#finalise' do
    it 'completes the order' do
      order = Order.new
      order.add("Ramen")
      expect(order.finalise).to be_empty
    end
  end

  describe "send text" do
    it 'sends a text back to the user' do
      expect(subject.send_text).to eq "Thank you! Your order was placed and will be delivered before 18:52"
    end
  end

end