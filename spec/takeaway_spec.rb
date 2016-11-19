require './lib/takeaway'
describe TakeAway do

it "should be able to read the menu" do
  takeaway = TakeAway.new(Menu.new)
expect(takeaway.read_menu).to be_a Hash
end

it "should be able to order options from the menu" do
  takeaway = TakeAway.new(Menu.new)
  takeaway.order("sandwich", 1)
  expect(takeaway.basket).to be_a Hash
end

it "should be able to select a dish from the menu" do
  takeaway = TakeAway.new(Menu.new)
  takeaway.order("sandwich", 1)
  expect(takeaway.basket).to eq ({"sandwich" => 3})
end

it "should be able to select more than one dish from the menu" do
  takeaway = TakeAway.new(Menu.new)
  takeaway.order("sandwich",1)
  takeaway.order("jellyfish",1)
  expect(takeaway.basket).to eq ({"sandwich" => 3, "jellyfish" => 5})
end

it "should be able to select the same dish twice from the menu" do
  takeaway = TakeAway.new(Menu.new)
  takeaway.order("sandwich",2)
  expect(takeaway.basket).to eq ({"sandwich" => 3, "sandwich" => 3})
end








end
