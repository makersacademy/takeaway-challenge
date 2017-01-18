require 'dish'

describe Dish do
  let(:name) { double :name }
  let(:ingredients) { double :ingredients }
  let(:price) { double :price }
  let(:category) { double :category }
  subject(:dish) {described_class.new}
  subject(:dish_info) {described_class.new(name,ingredients,price,category)}

  it 'creates an instance of a class' do
    expect(dish).to be_a(Dish)
  end

  describe '#name' do
    let(:new_name) {double :new_name}
    it 'stores dish name' do
      expect(dish_info.name).to eq(name)
    end
    it 'name can be changed' do
      dish_info.name = new_name
      expect(dish_info.name).to eq(new_name)
    end
  end

  describe '#ingredients' do
    let(:new_ingredients) { double :new_ingredients }
    it 'stores dish ingredients' do
      expect(dish_info.ingredients).to eq(ingredients)
    end
    it 'ingredients can be changed' do
      dish_info.ingredients = new_ingredients
      expect(dish_info.ingredients).to eq(new_ingredients)
    end
  end

  describe '#price' do
    let(:new_price) { double :new_price }
    it 'stores dish price' do
      expect(dish_info.price).to eq(price)
    end
    it 'price can be changed' do
      dish_info.price = new_price
      expect(dish_info.price).to eq(new_price)
    end
  end

  describe '#category' do
    let(:new_category) { double :new_category }
    it 'stores dish category' do
      expect(dish_info.category).to eq(category)
    end
    it 'category can be changed' do
      dish_info.category = new_category
      expect(dish_info.category).to eq(new_category)
    end
  end

end
