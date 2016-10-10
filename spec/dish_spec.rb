require 'Dish'
describe Dish do
  subject(:dish){described_class.new(name = "Hamburger", price = 15)}
  it 'knows its name' do
    expect(dish.name).to eq("Hamburger")
  end

  it 'knows its price' do
    expect(dish.price).to eq(15)
  end

end
