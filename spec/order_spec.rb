require 'order'
describe Order do
  it 'can accept a list of dishes' do
    dishes = {  "Chicken curry" => "1" }
    expect(subject.place_order(dishes)).to include(
      "Chicken curry" => "1")
  end
end
