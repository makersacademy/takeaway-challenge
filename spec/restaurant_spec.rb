require 'restaurant'

describe Restaurant do

  it 'lists the dishes with their prices' do
    expect(subject.print_menu).to eq(subject.menu_arr)
  end

end
