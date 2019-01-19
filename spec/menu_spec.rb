require 'menu'

describe Menu do

  it 'should print menu' do
    expect(subject.print_menu).to eq subject.food_menu
  end  
end
