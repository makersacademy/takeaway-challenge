require 'dish'

describe Dish do
  subject(:dish) { described_class.new('Plantain tacos') }

  it 'should have a name' do
    expect(dish.name).to eq 'Plantain tacos'
  end

end
