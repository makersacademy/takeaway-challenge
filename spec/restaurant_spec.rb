require 'restaurant'
describe Restaurant do
  let(:dish) { double :dish }
  it 'accepts a ::dish' do
    expect(subject.load_dishes(dish)).to eq [dish]
  end
  it 'has a list of dishes' do
    expect(subject.dishes).to eq [dish]
  end
end
