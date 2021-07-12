require 'takeaway'

describe Takeaway do
  let(:item1) { MenuItem.new('Item1', 5) }
  let(:item2) { MenuItem.new('Item2', 10) }
  let(:menu) { Menu.new(item1, item2) }
  let(:takeaway) { Takeaway.new(menu) }
    
  it 'the user is welcomed' do
    expect { takeaway.welcome_output }.to output("Welcome to the Takeaway, what would you like to do?\n").to_stdout
  end
  it 'the user sees options' do
    expect { takeaway.option_output }.to output("Enter 1 to view menu, 2 to order food.\n").to_stdout
  end

  it 'given there is a menu when user chooses option 1 then return menu' do
    printed_menu = "1. #{item1.name} £#{item1.price}\n2. #{item2.name} £#{item2.price}\n"
    expect { takeaway.select_choice(1) }.to output(printed_menu).to_stdout
  end

  it 'given there is a menu when user chooses option 2 then ask user to select menu items' do
    expect { takeaway.select_choice(2) }.to output("Please enter the number of the dishes you would like to select, separated by a comma.\n").to_stdout
  end

  it 'returns the items input in the order as an array of integers' do
    expect(takeaway.create_order(["1", "2"])).to eq [0, 1]
  end

  it 'displays the total of the order to user' do
    expect(takeaway.total([0, 1])).to eq 15
  end

  it 'displays receipt to user' do
    expect { takeaway.receipt([0, 1], 15) }.to output("Receipt\n""#{item1.name} £#{item1.price}\n#{item2.name} £#{item2.price}\n""----------------------------\n""Your order total is £15\n").to_stdout
  end
end
