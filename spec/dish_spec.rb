require 'dish'

describe Dish do
  let(:name) { double :name }
  let(:price) { double :price }
  subject(:dish) {described_class.new}
  subject(:dish_info) {described_class.new(name,price)}

  it 'creates instance of a class' do
    expect(dish).to be_a(Dish)
  end

  context 'name' do
    let(:new_name) {double :new_name}
    it 'stores dish name' do
      expect(dish_info.name).to eq(name)
    end
    it 'can change name' do
      dish_info.name = new_name
      expect(dish_info.name).to eq(new_name)
    end
  end

  context 'price' do
    let(:new_price) { double :new_price }
    it 'stores dish price' do
      expect(dish_info.price).to eq(price)
    end
    it 'can change price' do
      dish_info.price = new_price
      expect(dish_info.price).to eq(new_price)
    end
  end

end
