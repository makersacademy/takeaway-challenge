require 'menu'

describe Menu do
  it "creates a new instance of menu" do
    expect(subject).to be_an_instance_of Menu
  end

  it "initializes with a full menu" do
    expect(subject.dishes).to include("pizza", "burger", "steak", "ice cream", "chow mein")
  end

  it "can be initialized with a custom menu" do
    custom_menu = Menu.new(dishes = { "chips" => 1.50, "fish" => 3.50, "sausage" => 2.50})
    expect(custom_menu.dishes).to include("chips", "fish", "sausage")
  end
end
