require 'menu'

describe Menu do

it "prints out the menu" do
  expect(subject.menu).to eq [{"Mouse stew" => 12.50}, {"fish pizza" => 12},
  {"kirill kebab" => 7},{"rat stew" => 6},{"avocado on touser" => 3}]
end







end
