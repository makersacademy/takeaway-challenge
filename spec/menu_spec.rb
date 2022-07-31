require "menu"
describe Menu do
  menu = Menu.new({ "donut" => 6.50, "chocolate" => 1.50 })
  it "has a list of dishes with prices" do
    expect(menu.dishes).to include("chocolate" => 1.50)
  end
  it "prints a list of dishes with prices" do
    expect(menu.list).to eq("donut £6.50, chocolate £1.50")
  end
end
