require 'order'

describe Order do

  subject(:order)      { Order.new }
  let(:selection)      { double "a hash of selections" }
  let(:estimated_total) { double "the estimated cost" }


  describe "#select_menu_items" do
    it "stores the estimated total in @estimated_total" do
      expect{order.select_menu_items(selection, estimated_total)}
        .to change{ order.estimated_total }.to estimated_total
    end

    it "stores the selection in @selection" do
      expect{order.select_menu_items(selection, estimated_total)}
        .to change{ order.selection }.to selection
    end
  end

end
