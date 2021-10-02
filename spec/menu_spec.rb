require "menu"

describe Menu do
  let(:items) { [ Dish.new("chow_mein", 4.50), Dish.new("fried_rice", 4.50) ] }
  let(:menu) { described_class.new(items)}

  it "stores a list of dishes" do
    expect(menu.items). to eq(items)
  end
end