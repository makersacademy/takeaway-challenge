require 'dish'
describe Dish do
  subject = Dish.new("Spaghetti",13)
  it "should add description " do
    expect(subject.description).to eq "Spaghetti"
  end
  it "should add price" do
    expect(subject.price).to eq 13
  end
end
