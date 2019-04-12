require 'takeaway'
require 'menu'

describe Takeaway do
  it 'shows the list of dishes with prices' do
    food_person = Menu.new
    food_person.list
    expect(subject.show_menu).to eq food_person.food_list
  end
end
