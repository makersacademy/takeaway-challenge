require 'dish'

describe Dish do
  let(:name) { double :name }
  let(:ingredients) { double :ingredients }
  let(:price) { double :price }
  let(:type) { double :type }
  subject(:dish) {described_class.new}
  subject(:dish_info) {described_class.new(name,ingredients,price,type)}

  it 'creates an instance of a class' do
    expect(dish).to be_a(Dish)
  end

  context 'name' do
    let(:new_name) {double :new_name}
    it 'stores dish name' do
      expect(dish_info.name).to eq(name)
    end
    it 'name can be changed' do
      dish_info.name = new_name
      expect(dish_info.name).to eq(new_name)
    end
  end

  context 'ingredients' do
    let(:new_ingredients) { double :new_ingredients }
    it 'stores dish ingredients' do
      expect(dish_info.ingredients).to eq(ingredients)
    end
    it 'ingredients can be changed' do
      dish_info.ingredients = new_ingredients
      expect(dish_info.ingredients).to eq(new_ingredients)
    end
  end

  context 'price' do
    let(:new_price) { double :new_price }
    it 'stores dish price' do
      expect(dish_info.price).to eq(price)
    end
    it 'price can be changed' do
      dish_info.price = new_price
      expect(dish_info.price).to eq(new_price)
    end
  end

  context 'type' do
    let(:new_type) { double :new_type }
    it 'stores dish type' do
      expect(dish_info.type).to eq(type)
    end
    it 'type can be changed' do
      dish_info.type = new_type
      expect(dish_info.type).to eq(new_type)
    end
  end

end
