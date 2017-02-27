require 'order'

describe Order do
  let(:restaurant) { Restaurant.new }
  subject(:order) { described_class.new(restaurant) }

  describe "Adding items to order" do
    let(:stir_fry_double) do
      { :food => 'stir-fry', :price => '10' }
    end
    before do
      allow(restaurant).to receive(:menu).and_return([
        stir_fry_double,
        { :food => 'peanuts', :price => '5' },
        ])
    end
    let(:current_order_double) do
      [{:dish => stir_fry_double, :quantity => 2}]
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
    end
  end
end
