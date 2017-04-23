require './lib/list.rb'
describe List do
  it "records a list of dishes and their prices" do
  expect(subject.dishes['Chow Mein']).to eq 5.99
end
end
