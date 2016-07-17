require 'takeaway'

describe Takeaway do
  it "Gives the user a menu on request" do
    expect(subject.menu).to eq ({:Chicken_Burger => 4, :Chips => 1.5, :Cheeseburger => 4.5, :Kebab => 3.5})
  end

  it "Allows the user to select items from the menu" do
    expect(subject.order(:Chicken_Burger)).to eq 4
  end

end
