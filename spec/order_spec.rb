require 'order'

describe Order do

  subject(:order) { described_class.new }

  context '_no items added to order_' do

    describe '.display' do
      it "raises error" do
        expect { order.display }.to raise_error "No items in basket. Please select dishes"
      end
    end
  end

  context ' 1 item added to order' do
    describe '.add' do
      it { is_expected.to respond_to(:add).with(2).arguments }
      it 'updates order array with dish, quantity and pricexquantity' do
        expect(order.add(1,2)).to match_array(['pizza', 2, 21.00])
      end
    end

  end

  context ' 3 items added to order' do

  end

  describe '.confirmed' do

  end

end
