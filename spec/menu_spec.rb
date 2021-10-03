require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  let(:item_one) { double :item, :name => "name one", :price => "£0.01" }

  it "contains added item" do
    menu.add(item_one.name, item_one.price, item_one)
    expect(menu.list).to include item_one
  end

end
