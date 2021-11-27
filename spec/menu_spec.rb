require 'menu'

describe Menu do
  let(:menu) { Menu.new }

  it "list all the dishes available to select" do
    expect(menu.list_dishes).to be_an_instance_of Array
  end

  it "select and return a dish (hash) with quantity" do
    expect(menu.select_dish("marinara", 2)).to eq({ dish: "marinara", price: "£5.50", quantity: 2 })
  end
end
