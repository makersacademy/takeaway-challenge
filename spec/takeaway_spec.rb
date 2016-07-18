require 'takeaway'

describe Takeaway do
  let(:menu) {double(:menu)}
  it "Gives the user a menu on request" do
    expect(subject.menu).to eq ({:Chicken_Burger => 4, :Chips => 1.5, :Cheeseburger => 4.5, :Kebab => 3.5})
  end
  it 'checks to see whether the price given matches the correct price' do
    subject.order(5.5, :Chicken_Burger, :Chips)
    expect(subject.price).to eq 5.5
  end
end
