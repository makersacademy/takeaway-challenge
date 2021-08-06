require 'menu'

describe Menu do
  
  menu = {
    "Hamburger" => 4.99, 
    "Hot Dog" => 4.49, 
    "Cheeseburger" => 5.49
  }
  
  formatted_menu = "Hamburger        4.99\n"\
                   "Hot Dog          4.49\n"\
                   "Cheeseburger     5.49\n"

  it 'menu_hash method returns menu hash' do
    expect(subject.menu_hash).to eq menu
  end

  it 'view_menu method returns formatted menu' do
    expect { subject.view_menu }.to output(formatted_menu).to_stdout
  end
  
end
