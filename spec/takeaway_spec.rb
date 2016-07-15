require 'takeaway'

describe Takeaway do
  it "Gives the user a menu on request" do
    expect(subject.menu).to eq ({:Chicken_Burger => 4, :Chips => 1.5, :Cheeseburger => 4.5, :Kebab => 3.5})
  end

  it "Allows the user to select items from the menu" do
    expect(subject.order(:Chicken_Burger)).to eq 4
  end

  it "returns a list of orders" do
    subject.order(:Chicken_Burger)
    subject.order(:Chips)
    expect(subject.current_order).to eq ([:Chicken_Burger, :Chips])
  end

  it "calcuates order total" do
    subject.order(:Chicken_Burger)
    subject.order(:Chips)
    expect(subject.ordertotal).to eq 5.5
  end

  it "return a list of orders and total price on completion" do
    subject.order(:Chicken_Burger)
    subject.order(:Chips)
    expect(subject.complete).to eq ("#{subject.current_order}, #{subject.ordertotal}")
  end

end
