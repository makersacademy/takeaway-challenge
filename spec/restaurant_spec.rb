require 'restaurant'
describe Restaurant do
  let(:dish) { double :dish }
  it 'has a ::dish' do
    expect(subject.load_dishes(dish)).to eq dish
  end
end
