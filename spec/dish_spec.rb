require "dish"

describe Dish do

let(:pricemanager){double :pricemanager, :get_dish_price => true}

  it "publishes the string form of the dish" do
    subject = described_class.new("korma", "main")
    expect(subject.publish_dish).to eq "In category: main dish - korma cost - 15"
  end

  it "upon creation of new dish, gets the price of a dish from price manager" do
    expect(pricemanager).to receive(:get_dish_price)
    Dish.new("korma","main",pricemanager)
  end

end
