require 'order'
describe Order do
  let(:dish) { double :dish }
  it 'add dish to order' do
    subject.add_dish(dish)
    expect(subject.add_dish(dish)).to eq dish
  end
end
