require 'menu'

describe Menu do
  it 'adds a dish and returns the menu list' do
    dish = double (:dish)
    allow(dish).to receive(:name).and_return("katsu")
    allow(dish).to receive(:price).and_return(2.5)
    subject.add_dish(dish)
    expect(subject.list).to eq dish.name => dish.price
  end
end