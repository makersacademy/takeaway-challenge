require "takeaway"

describe Menu do
  it "responds to #list_meals" do
    expect(subject).to respond_to(:list_dishes)
  end

  it "has a list of food items" do
    expect(subject.dishes).to include(:hotdog, :burger, :fries, :milkshake, :soda)
  end

  it "shows a list of dishes with corresponding prices" do
    expect(subject.dishes).to match(:burger => (a_value < 6), :hotdog => (a_value < 5), :fries => (a_value < 4), :milkshake => (a_value < 5),:soda => (a_value < 4))
  end

  it "responds to #add_to_basket" do
    expect(subject).to respond_to(:add_to_basket).with(2).argument
  end

  it "is capable of adding an item to basket" do
    expect(subject.add_to_basket(:burger)).to eq(subject.basket.join)
  end

  it "is capable of adding multipes of the same item to basket" do
    expect(subject.add_to_basket(:burger, 2)).to eq(subject.basket.join)
  end

  it 'does not accepts orders outside the menu' do
    expect{subject.add_to_basket(:pizza)}.to raise_error "Please order from menu"
  end
end
