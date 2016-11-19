require 'takeaway'

describe Takeaway do

  let( :meals ){ double :meals }

  it 'pulls a menu from the Meals class' do
    expect(subject.menu).to eq(meals.menu_list)
  end



end
