require 'dishes'

describe Dishes do

  subject(:dishes) { described_class.new }

  it 'stores a list of dishes' do
    expect(dishes.list[0]).to be_an_instance_of Dish
  end

end
