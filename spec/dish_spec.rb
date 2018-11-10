require 'dish'
require_relative './test_data'
describe Dish do
  let(:attributes_hash) {  TestData::menu_data.first }
  let(:attributes_hash2) {  TestData::menu_data.last }
  subject(:dish) { Dish.new() }

  it 'has blank instance variables at instantiation' do
    expect(dish.name).to eq("")
    expect(dish.description).to eq("")
    expect(dish.price).to eq(0)
  end

  it 'has instance variables that can be set' do
    dish.name = attributes_hash
    dish.description = attributes_hash
    dish.price = attributes_hash
    expect(dish.name).to eq(attributes_hash[:name])
    expect(dish.description).to eq(attributes_hash[:description])
    expect(dish.price).to eq(attributes_hash[:price])
  end

  it 'has a method to set all attributes at once' do
    dish.set_all(attributes_hash2)
    expect(dish.name).to eq(attributes_hash2[:name])
    expect(dish.description).to eq(attributes_hash2[:description])
    expect(dish.price).to eq(attributes_hash2[:price])
  end
end
