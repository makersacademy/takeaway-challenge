require 'place_order'

describe PlaceOrder do

  describe "#takes_dishes" do
    it { is_expected.to respond_to(:ask_for_order) }
    it 'asks for an order' do
      expect(subject.ask_for_order).to eq ("Please place your order in the form of order number, quantity. E.g. '23, 7'")
    end
    it { is_expected.to respond_to(:take_order) }
    it 'gets an order' do
      allow($stdin).to receive(:gets).and_return('foo')
      test_order = $stdin.gets
      expect(test_order).to eq('foo')
    end
  end

  describe "#checks total" do
  end
  
  describe "gets number" do
  end

end
