require 'cart'
describe Cart do

  it 'starts with an empty cart' do
    expect(subject.cart).to eq({})
  end

  describe '#add_item' do
    it 'can add 1 item to the cart' do
      expect { subject.add_item("burger") }.to change { subject.cart.count }.by(1)
    end
  end

  describe '#summarize' do
    it 'summarizes whats in the cart' do
      subject.add_item("burger", 3)
      subject.add_item("fries", 1)
      expect(subject.summarize).to eq("burger x 3 = 15, fries x 1 = 3")
    end
  end

  describe '#total' do
    it 'prints total cost of cart' do
      subject.add_item("burger", 3)
      subject.add_item("fries", 1)
      expect(subject.total).to eq("Total: £18")
    end
  end

end
