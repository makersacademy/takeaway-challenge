require 'menu'

describe Menu do

  it 'displays the menu items' do
    expect(subject.display_menu['Cheeseburger']).to eq '3.50'
  end

end
