require 'dish'

describe Dish do

  subject(:dish) { described_class.new('Wok-fried greens') }

  it 'should have name' do
    expect(dish.name).to eq 'Wok-fried greens'
  end


end
