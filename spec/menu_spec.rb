require 'menu'

describe Menu do

  menu_hash = {
    "Hamburger" => 4.99, 
    "Hot Dog" => 4.49, 
    "Cheeseburger" => 5.49
  }
  
  it 'menu is a hash containing dishes and prices' do
    expect(subject.menu).to include(menu_hash)
  end

end
