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

  context 'item added to order' do
    describe '.display' do
      it 'when pizza added to order once, displays pizza with quantity 1 and price £10.50' do
        order.add(1, 1)
        expect { order.display }.to output(/pizza/).to_stdout
        expect { order.display }.to output(/ 1 /).to_stdout
        expect { order.display }.to output(/£10.50/).to_stdout
      end
      it 'when pizza added to order twice at once, displays pizza with quantity 2 and price £21.00' do
        order.add(1, 2)
        expect { order.display }.to output(/pizza/).to_stdout
        expect { order.display }.to output(/ 2 /).to_stdout
        expect { order.display }.to output(/£21.00/).to_stdout
      end
      it 'when pizza added to order twice, displays pizza with quantity 2 and price £21.00' do
        order.add(1, 1)
        order.add(1, 1)
        expect { order.display }.to output(/pizza/).to_stdout
        expect { order.display }.to output(/ 2 /).to_stdout
        expect { order.display }.to output(/£21.00/).to_stdout
      end
    end

  end

  describe '.confirmed' do

  end

end
