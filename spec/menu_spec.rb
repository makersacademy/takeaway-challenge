require "Menu"

describe Menu do

  subject(:menu) { Menu.new(list_of_dishes)} #inject the hash to the menu (needs to be initialized!)
  #create a list of dishes hash
  let(:list_of_dishes) do {
      Coffee: 0.99,
      Sandwich: 3.99,
      Water: 1.19,
      Salad: 4.99
  }
  end
  it "contains list of dishes with prices" do
    expect(menu.list_of_dishes).to eq(list_of_dishes)
  end
end