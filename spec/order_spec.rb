require 'order'

describe Order do
  subject(:order) { described_class.new }

  it "allows customer to see dishes available" do
    expect(order).to respond_to(:dish)
  end

  it "will return a list of dishes" do
    order.dish
    expect(order.list_of_dishes).to eq [{ "Roasted stuffed cauliflower" => 13},
                                        { "Stuffed pumpkin" => 12},
                                        { "Vegan chilli" => 15},
                                        { "Vegan brownies" => 8}]
  end
end
