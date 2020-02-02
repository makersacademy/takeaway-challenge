require 'place_order'

describe PlaceOrder do

  describe "#takes_dishes" do
    it { is_expected.to respond_to(:ask_for_order) }
    it 'asks for an order' do
      expect(subject.ask_for_order).to eq ("Please place your order in the form of order number, quantity. E.g. '23, 7'")
    end
  end

  describe "#checks total" do
  end
  
  describe "gets number" do
  end

end
