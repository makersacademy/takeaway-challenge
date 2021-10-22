require 'item'
describe Item do
  subject = Item.new(Dish.new("Spaghetti", 12), 3)
  it "Should add description " do
    expect(subject.dish.description).to eq "Spaghetti"
  end
  it "should add price" do
    expect(subject.dish.price).to eq 12
  end
  it "should add qty" do
    expect(subject.qty).to eq 3
  end

end
