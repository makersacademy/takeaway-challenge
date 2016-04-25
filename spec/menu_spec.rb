require 'Menu'

describe Menu do

let(:dish_list) { {'Spring Roll' => 2,
  'Roasted Chicken' => 5, 'French Fries' => 3,
  'Milkshake' => 2, 'Hamburger' => 4, 'Nachos' => 2,
   'Doner Kebab' => 3}}
   
  it 'contains a list of all the dishes' do
    expect(subject.dishes).to eq dish_list
  end
end
