require 'dish'

describe Dish do
  let(:dish_id) { 1 }
  let(:dish_name) { 'Dish name' }
  let(:dish_price) { 5.50 }
  subject { Dish.new(dish_id, dish_name, dish_price) }

  context '#initialize' do
    it '@id is the ID set' do
      expect(subject.id).to eq dish_id
    end

    it '@name is the name set' do
      expect(subject.name).to eq dish_name
    end

    it '@price is the price set' do
      expect(subject.name).to eq dish_name
    end
  end
end
