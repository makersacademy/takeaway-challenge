require "meal"

describe Meal do
  it "creates an instance of meal" do
    expect(Meal.new).to be_an_instance_of(Meal)
  end
end