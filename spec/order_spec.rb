require './lib/order'
describe Order do
  it "allows food to be chosen by number" do
    expect(subject.order_food(2)).to eq [{ 2 => "Crispy shredded beef", :Price => 6.99 }]
  end
  it "adds ordered food to a basket" do
    subject.order_food(3)
    expect(subject.basket[0]).to eq ({ 3 => "Supreme Mega Deluxe Royale Meal", :Price => 399.99 })
  end
end
