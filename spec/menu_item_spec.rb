require 'menu_item'

describe MenuItem do
  subject(:menu_item) { MenuItem.new('name',1)}

  it "has a name" do
    expect(menu_item.name).to eq 'name'
  end

  it "has a price" do
    expect(menu_item.price).to eq 1
  end

end
