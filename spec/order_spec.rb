require 'order'

describe Order do
  subject(:order){described_class.new}

  describe '#view_menu' do
    it "prints out the menu" do
      expect(order.view_menu).not_to be_empty
    end
  end

end
