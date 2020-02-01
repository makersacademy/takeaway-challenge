require 'takeaway'
describe TakeAway do

  describe '#show_menu' do
    it 'prints a list of dishes available' do
      expect(subject.show_menu).to eq({ "burger" => 5, "fries" => 3, "shake" => 2 })
    end
  end

  describe '#pay' do
    let(:cart) { double("cart", total: 19) }
    subject(:takeaway) { described_class.new(cart) }
    it 'kicks up error if money handed in does not equal the cart total' do
      expect { takeaway.pay(18) }.to raise_error("Incorrect £ given")
    end
  end

end
