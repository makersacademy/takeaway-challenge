require 'dish'

describe 'Dish' do

  let(:dish) {Dish.new('Tasty Tofu')}

  it 'has a name' do

    expect(dish.name).to eq 'Tasty Tofu'


  end



end