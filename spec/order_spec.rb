require 'order'
require 'message'

describe Order do
  let(:dishes) do { lasagna: 4.50, pizza: 7.50, steak: 17.50 } end
  subject(:order) { described_class.new(dishes) }

  before do
    order.select_dish(:pizza, 1)
    order.select_dish(:lasagna, 3)
  end

  describe '#select_dish' do
    it { is_expected.to respond_to(:select_dish).with(2).arguments }
    it 'adds a number of dishes from the list to the order' do
      expect(order.current_order).to eq({ pizza: 1, lasagna: 3 })
    end

    context 'when dish not in the list' do
      it "raises an error" do
        expect{order.select_dish(:soup, 6)}.to raise_error "There is no soup in the list. Please select a dish from the list."
      end
    end
  end

    describe "#total" do
      it { is_expected.to respond_to(:total) }
      it "calculates the total cost of the order" do
        expect(order.total).to eq 21
      end
    end

    describe "#verify_total" do
      it { is_expected.to respond_to(:confirm_total).with(1).arguments }
      it "checks that the total is correct" do
        expect(order.confirm_total(21)).to be true
      end

      context "when the total doesn't match" do
        it "raises an error" do
          expect{order.confirm_total(11)}.to raise_error 'Your total is not correct. Enter 21.0 to process the order.'
        end
      end
    end
end
