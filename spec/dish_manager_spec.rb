require 'dish_manager'

describe DishManager do
  let(:dish) { double(:dish, name: 'Crabs', price: 20.0) }

  before(:each) do
    subject.available_dishes << dish
  end

  it 'is an instance of DishManager' do
    expect(subject).to be_an_instance_of DishManager
  end

  it 'has available dishes' do
    expect(subject).to respond_to :available_dishes
  end

  it 'gets an available dish given a name' do
    expect(subject.find_dish_by_name(dish.name)).to eq dish
  end
end