require './lib/menu'

describe Menu do

  it "should store a menu" do

    expect(subject.menu).to eq ({egg_fried_rice: 2, white_rice: 2, can_of_coke: 1, bottle_of_water: 1, duck_in_black_bean_sauce: 5, quarter_aromatic_crispy_duck: 8, half_aromatic_crispy_duck: 15, full_aromatic_crispy_duck: 29})
  end



end
