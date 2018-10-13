require "takeaway"

describe Takeaway do

   let(:menu){double :menu, :menu_to_str => true}
   let(:order){double :order, :publish_order => true, :confirm_order => true}
   subject(:takeaway){described_class.new(menu: menu, order: order)}

  it "responds to the method request_menu" do
    expect(takeaway).to respond_to(:publish_menu)
  end

  it "requests a menu from the menu class" do
    expect(menu).to receive(:publish_menu)
    takeaway.publish_menu
  end

  it "requests order to show itself" do
    expect(order).to receive(:publish_order)
    takeaway.publish_order
  end

  it "requests order to confirm itself" do
    expect(order).to receive(:confirm_order)
    takeaway.confirm_order
  end

end
