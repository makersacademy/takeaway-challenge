require 'menu'
describe Menu do
  subject(:menu) {described_class.new}

  it "has a list of dishes with prices" do
    expect(menu.dishes_list).to eq([{dish: "Chicken and rice", prize: 3.50},
      {dish: "Lamb and rice", prize: 4.0},
      {dish: "Beef and rice", prize: 4.50}])
  end
end
