require "Menu"
describe Menu do
  it "allow you to read dishes and prices" do
    menu = double("menu", dish: "Chicken", price: 4.99)
    expect(menu.dish).to eq("Chicken")
    expect(menu.price).to eq(4.99)
  end 
end

