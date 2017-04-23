require './lib/list.rb'
describe List do
  it "records a list of dishes and their prices" do
  expect(subject.dishes[:one]).to eq {'Chow Mein' => 5.99}
end
end
