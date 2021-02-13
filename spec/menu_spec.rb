require './lib/menu.rb'

describe Menu do

context "on initialize" do
it "ititializes with contents" do
  expect(subject).to respond_to(:contents)
end
it "has a contents(menu) with dishes on it" do
  expect(subject.contents.first[:pizza]).not_to eq nil
end
it "has a contents(menu) with prices on it" do
  expect(subject.contents.first[:price]).not_to eq nil
end
end

it "allows the customer to view the menu" do
  expect(subject).to respond_to(:view)
end

end
