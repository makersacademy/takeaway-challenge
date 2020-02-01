require 'cart'
describe Cart do

  it 'starts with an empty cart' do
    expect(subject.cart).to eq([])
  end

  describe '#add_to_cart' do
    it 'adds items to the cart' do
      expect { subject.add_to_cart("burger") }.to change { subject.cart.count }.by(1)
    end
  end

end
