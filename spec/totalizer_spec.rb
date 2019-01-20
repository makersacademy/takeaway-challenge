require 'totalizer'

describe Totalizer do

  let(:menu) { { veggie_burger: 2.5, biscuit: 9.99, spoons: 0.1 } }
  let(:order) { { biscuit: 1, veggie_burger: 5 } }
  let(:totalizer) { Totalizer.new(order_hash: order, menu_hash: menu) }

  describe '#total' do
    it 'calculates the right total' do
      expect(totalizer.total).to eq '22.49'
    end
  end

end
