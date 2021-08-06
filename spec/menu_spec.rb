require 'menu'

describe Menu do

  menu = "Hamburger        4.99\n"\
         "Hot Dog          4.49\n"\
         "Cheeseburger     5.49\n"

  it 'view method returns menu' do
    expect { subject.view }.to output(menu).to_stdout
  end
  
end
