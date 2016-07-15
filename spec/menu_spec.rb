require 'menu'

describe Menu do
  it "initializes with a menu" do
    expect(subject.menu).to include({:Chicken_Burger => 4, :Chip => 1.5, :Cheeseburger => 4.5})
  end
end
