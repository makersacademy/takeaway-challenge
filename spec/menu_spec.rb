require 'menu'

describe Menu do

  it "has a list of dishes and prices when created" do
    expect(subject.dishes).to eq Menu::DISHES
  end

  let(:dishes) { {"Salad" => 6}}

  it "lets the user see the menu" do
    menu = Menu.new
    expect(menu.view).to include(dishes)
  end

end
