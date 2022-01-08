require "Menu"
describe Menu do
  it "allow you to read dishes and prices" do
    my_menu = double("Tapas", dish: "Pinchitos", price: 6.99)
    expect(my_menu.dish).to eq("Pinchitos")
    expect(my_menu.price).to eq(6.99)
  end 
end
