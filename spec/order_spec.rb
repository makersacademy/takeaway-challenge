require 'order'

describe Order do
  let(:dishes) do { lasagna: 4.50, pizza: 7.50, steak: 17.50 } end
  subject(:order) { described_class.new(dishes) }

  describe '#select_dish'
    it { is_expected.to respond_to(:select_dish).with(2).arguments }
    it 'adds a number of dishes from the list to the order' do
      order.select_dish(:pizza, 1)
      order.select_dish(:lasagna, 3)
      expect(order.current_order).to eq({ pizza: 1, lasagna: 3 })
    end

    context 'when dish not in the list' do
      it "raises an error" do
        expect{order.select_dish(:soup, 6)}.to raise_error "There is no soup in the list. Please select a dish from the list."
      end
    end
end
