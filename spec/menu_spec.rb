require './lib/menu'
describe Menu do

it "should have a number of options on the menu" do
  expect(subject.menu).to eq({"bread" => 1,"jellyfish" => 5,"sandwich" => 3})
end

end
