require 'restaurant'
describe Restaurant do

  it 'has a menu' do
  restaurant = Restaurant.new
  expect(subject.menu).to_not be_empty
end

end