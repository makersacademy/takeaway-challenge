require 'restaurant'
describe Restaurant do
  it 'displays a list of dishes' do
    subject.load_dishes("./lib/dishes.txt")
    expect(subject.dishes).to include(
      "Chicken curry" => 3.5, "Lamb curry" => 4.0)
  end
end

# describe Restaurant do
#   let(:dish) { double :dish }
#   it 'accepts a ::dish' do
#     expect(subject.load_dishes(dish)).to eq [dish]
#   end
#   it 'has a list of dishes' do
#     subject.load_dishes(dish)
#     expect(subject.dishes).to eq [dish]
#   end
# end
