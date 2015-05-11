require 'dishes'

describe Dishes do
  it "has a list of a dishes" do
    expect(subject.dish_list).to eq :FishAndChips => 5, :MeatAndTwoVeg => 7
  end

  it "can have a new dish" do
    subject.new_dish :Pasta, 6
    expect(subject.dish_list.length).to eq 3
  end

  it "can change price" do
    subject.change_price :FishAndChips, 8
    expect(subject.dish_list).to eq :FishAndChips => 8, :MeatAndTwoVeg => 7
  end
end