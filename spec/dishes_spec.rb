require 'dishes'

describe Dishes do


  it { is_expected.to respond_to(:menu)}


  it 'allows user to see a list of dishes with prices' do
    dish = Dishes.new
    expect(dish.menu).to include({ "shoes" => 78 })
  end


end
