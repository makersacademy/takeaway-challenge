require 'menu'

describe Menu do
let(:station){ double(:station, zone: 1)}
it "holds an array of hashes which contains the menu" do
  expect(subject.menu).to eq [{"Mouse stew" => 13}, {"fish pizza" => 12},
  {"kirill kebab" => 7},{"rat stew" => 6},{"avocado on toast" => 3}]
end

it "prints out the menu for customer to view" do
  expect(subject.menu).to eq [{"Mouse stew" => 13}, {"fish pizza" => 12},
  {"kirill kebab" => 7},{"rat stew" => 6},{"avocado on toast" => 3}]
end
it "shows the customers basket for the customer to view" do
  expect(subject.view).to eq [{"Mouse stew" => 13}, {"fish pizza" => 12},{"kirill kebab" => 7}]
end

it "selects a number of items from the menu" do
  expect(subject.select).to eq [{"Mouse stew" => 13}, {"fish pizza" => 12},{"kirill kebab" => 7}]
end

it "saves selected items to the basket (empty array)" do
  expect(subject.save_to_basket).to eq [[{"Mouse stew" => 13}, {"fish pizza" => 12},{"kirill kebab" => 7}]]
end

it "returns the total price of the order" do
  expect(subject.total).to eq 34.50
end
# menu = double(:menu)
it "raises error when the order is wrong" do

end


end
