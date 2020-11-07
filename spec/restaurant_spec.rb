require 'restaurant'

describe Restaurant do
  let(:menu) { double :menu }
  let(:orderlist) { double :orderlist }
  let(:orderlist_class) { double :orderlist_class, new: orderlist }
  let(:menu_class) { double :menu_class, new: menu }

  it "initializes and creates an OrderList and a Menu" do
    expect(menu_class).to receive(:new)
    expect(orderlist_class).to receive(:new)
    Restaurant.new(orderlist_class, menu_class)
  end
end