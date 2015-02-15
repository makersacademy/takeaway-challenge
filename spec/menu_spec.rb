require 'menu'

describe Menu do

let(:schnitzel){double :dish, name: "Schnitzel", price: 4}
let(:menu){Menu.new}

  it "can contain dishes" do
    menu.add_dish(schnitzel)
    expect(menu.dishlist).not_to be_empty
  end

  
  
end