require 'takeaway'

describe Takeaway do
  it "creates an instance of Takeaway" do
    takeaway = Takeaway.new
    expect(takeaway).to be_a Takeaway
  end

  it 'creates a list of dishes' do
    takeaway = Takeaway.new
    dish = Dish.new
    subject.list_of_dishes(dish)
    expect(subject.list_of_dishes(dish)).to eq [dishes]
  end
end
