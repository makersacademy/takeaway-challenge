require 'order'

describe Order do
  let(:restaurant) { Restaurant.new }
  subject(:order) { described_class.new(restaurant) }

  describe "Adding items to order" do
    let(:stir_fry_double) do
      { :food => 'stir-fry', :price => '10' }
    end
    let(:current_order_double) do
      [stir_fry_double, stir_fry_double]
    end
    before do
      allow(restaurant).to receive(:menu).and_return([
        stir_fry_double,
        { :food => 'peanuts', :price => '5' },
      ])
    end

    it "allows user to specify selection for order" do
      expect(order.selection('stir-fry', 2)).to eq current_order_double
    end

    context "Creating order" do
      before do
        allow(order).to receive(:items).and_return(current_order_double)
      end

      it "provides the selected dishes and subtotal" do
        expect(order.subtotal).to eq "Current total: £20"
      end

      # it "finalises user order" do
      #   expect(order.final).to eq
      # end
    end
  end
end
