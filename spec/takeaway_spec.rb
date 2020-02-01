require 'takeaway'
describe TakeAway do

  describe '#show_menu' do
    it 'prints a list of dishes available' do
      expect(subject.show_menu).to eq({ "burger" => 5, "fries" => 3, "shake" => 2 })
    end
  end

  describe '#add_to_cart' do
    it 'adds items to the cart' do
      expect { subject.add_to_cart("burger") }.to change { subject.cart.count }.by(1)
    end
  end

end
