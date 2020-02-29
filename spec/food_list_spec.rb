require "food_list.rb"

describe FoodList do
  it "is an instance of the FoodList class" do
    expect(subject).to be_a(FoodList)
  end

  it "has a list of food and prices" do
    expect(subject.current_menu).to be_a(Hash)
  end
end
