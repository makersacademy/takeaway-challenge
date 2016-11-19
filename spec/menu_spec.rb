require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:dish) {double :dish}
  quantity = 2

  it "responds to list" do
    expect(menu).to respond_to(:list)
  end
  it "shows the list of the dishes with prices" do
    expect(menu.read_menu).to eq menu.list
  end
  it "adds new dishes to the list" do
    curry = Dish.new("Curry", 3)
    expect(menu.add(curry)).to include(curry)
  end

  it "adds the same dish only once" do
    curry = Dish.new("Curry", 3)
    menu.add(curry)
    expect(menu.add(curry).count).to eq 1
  end

  it "selects some number of several available dishes" do
    selected_dishes= menu.select(dish,quantity)
    expect(selected_dishes).to include({dish=>quantity})
  end

end
