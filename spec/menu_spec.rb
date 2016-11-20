require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:dish) {double :dish}
  let (:menu_list)  { menu.add(dish) }

  it "responds to list" do
    expect(menu).to respond_to(:list)
  end
  it "shows the list of the dishes with prices" do
    list = menu.read_menu
    expect(menu.read_menu).to eq list
  end
  it "adds new dishes to the list" do
    expect(menu_list).to include(dish)
  end

  it "adds the same dish only once" do
    expect(menu_list.count).to eq 1
  end

  # it "selects number of several available dishes" do
  #   quantity = 2
  #   selected_dishes= menu.select(dish,quantity)
  #   expect(selected_dishes).to include({dish=>quantity})
  # end

end
