require "dish"

describe Dish do
  let(:dish) { Dish.new("Mango Chutney", 100) }
  it "Sets the name of the dish on initialisation" do
    expect(dish.name).to eq "Mango Chutney"
  end
  it { expect(dish).to respond_to(:set_availability)}
  it "#available? returns true initially" do
    expect(dish.available?).to eq true
  end
  it "#available? returns false after #set_availability(false)" do
    dish.set_availability(false)
    expect(dish.available?).to eq false
  end
  it "#get_formatted_price returns the formatted price" do
    expect(dish.get_formatted_price).to eq("£1.00")
  end

end
