require 'menu'

describe Menu do
  
  it 'should be initialized with an empty array' do
    expect(subject.list_dishes).to be_empty
  end

  it 'should list dishes with prices on the menu' do
    dish = Dish.new('some dish', 9.0)
    subject.add_dish(dish)
    expect(subject.list_dishes).to include(dish)
  end
end
