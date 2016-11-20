require './lib/takeaway'
require './lib/order'
describe TakeAway do
subject(:takeaway) {described_class.new(Menu.new)}

it "should be able to read the menu" do
  expect(takeaway.read_menu).to eq ({"bread" => 1,"jellyfish" => 5,"sandwich" => 3})
end

end
