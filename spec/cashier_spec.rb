require 'cashier'

describe Cashier do
subject(:cashier){described_class.new}

  describe '#checks_order' do
    it 'confirms if order is correct' do
      menu = {"soup" => 2}
      selection = {"soup" => 2}
      expect(cashier.checks_order(menu,selection)).to respond_to(:upcase)
    end
  end


end