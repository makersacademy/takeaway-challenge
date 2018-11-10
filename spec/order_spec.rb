require 'order'

describe Order do
  let(:menu)  { Menu.new}
  let(:order) { Order.new(menu) }

  describe "#check_menu" do

    it "so that I can order, it would like to check the menu list with prices" do
      expect(order.check_menu).to eq menu
    end

  end



end
