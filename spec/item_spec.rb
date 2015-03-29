require 'item'

describe Item do 

let(:item) {Item.new :name, 99} 

it "can have a name" do
  expect(item.name).to eq :name
end

it "can have a price" do
  expect(item.price).to eq 99
end

it "knows if it is available" do
  expect(item).to be_available
end  

end  