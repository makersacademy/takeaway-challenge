require 'take_away'

describe TakeAway do

  it "shows the menu" do
    menu = double("menu", list_dishes: { marinara: "£5.50", margherita: "£6.50" })
    take_away = TakeAway.new(menu: menu)
    expect(take_away.menu).to eq (menu.list_dishes)
  end
end