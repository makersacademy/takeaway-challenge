require 'meal'

describe MealItem do
subject(:meal_new) { described_class.new("Burger","£10.00") }

  it "Can change meal items price" do
    meal = meal_new
    meal.change_price("£5.00")
    expect(meal).to have_attributes(price: "£5.00" )
  end

  it "Can add a meal description" do
    meal = meal_new
    meal.add_description("Tasty Aberdeen Angus")
    expect(meal).to have_attributes(description: "Tasty Aberdeen Angus" )
  end

end
