require "takeaway"

describe Menu do
  it "responds to #list_meals" do
    expect(subject).to respond_to(:list_dishes)
  end

  it "has a list of food items" do
    expect(subject.list_dishes).to include(:hotdog, :burger, :fries, :milkshake, :soda)
  end

  it "shows a list of dishes with corresponding prices" do
    expect(subject.dishes).to match(:burger => (a_value < 6), :hotdog => (a_value < 5), :fries => (a_value < 4), :milkshake => (a_value < 5),:soda => (a_value < 4))
  end
end
