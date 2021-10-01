require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  let(:item_one) { double :item, :name => "name one", :price => "£0.01" }
  let(:item_two) { double :item, :name => "name two", :price => "£0.02" }

  it "displays a menu with item one" do
    menu.add(item_one.name, item_one.price, item_one)
    expect(menu.display).to include item_one
  end

  it "displays a menu with item two" do
    menu.add(item_one.name, item_one.price, item_one)
    menu.add(item_two.name, item_two.price, item_two)
    expect(menu.display).to include item_one
  end

end
