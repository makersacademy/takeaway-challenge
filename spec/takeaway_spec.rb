require 'takeaway'

describe Takeaway do
  let(:menu) { Menu.new }
  let(:takeaway) { Takeaway.new(menu) }
    
  it 'given ... when ... then the user is welcomed' do
    expect { takeaway.welcome_output }.to output("Welcome to the Takeaway, what would you like to do?\n").to_stdout
  end
  it 'given ... when ... then the user sees options' do
    expect { takeaway.option_output }.to output("Enter 1 to view menu, 2 to order food.\n").to_stdout
  end

  it 'given there is a menu when user chooses option 1 then return menu' do
    printed_menu = "item1\nitem2\n"
    expect { takeaway.select_choice(1) }.to output(printed_menu).to_stdout
  end

end
