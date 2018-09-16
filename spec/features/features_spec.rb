require 'takeaway'
require 'menu'
require 'menu_item'
require 'order'

describe 'User stories' do
  let(:menu) { Menu.new }
  let(:order) { Order.new }
  let(:takeaway) { Takeaway.new(menu, order) }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
    
    # heredoc -> to define multiline strings
    # used to compare against output from initialised menu
  dummy_menu = <<-HEREDOC
1. Pizza: £8.00
2. Burger: £9.00
3. Chips: £4.50
  HEREDOC
  
  it 'outputs the menu to STDOUT' do
    expect { takeaway.read_menu }.to output(dummy_menu).to_stdout
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'allows users to order one or more of an available dish' do
    quantity = rand(1..5)
    takeaway.order_item('Pizza', quantity)
    takeaway.order_item('Chips')
    expect { takeaway.show_order_basket }.to output("Pizza: £8.00 x #{quantity}\nChips: £4.50 x 1\n").to_stdout
  end

  it 'raises error if user orders an item that is not on the menu' do
    expect { takeaway.order_item('Curry') }.to raise_error('This dish is not on the menu!')
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'shows users the total price of all ordered items' do
    takeaway.order_item('Pizza', 2)
    takeaway.order_item('Chips')
    expect { takeaway.show_order_total }.to output("Total: £20.50\n").to_stdout
  end

  it 'shows users the subtotals for each ordered item' do
    dummy_subtotals = <<-HEREDOC
Pizza x 2: £16.00
Chips x 1: £4.50
    HEREDOC
    takeaway.order_item('Pizza', 2)
    takeaway.order_item('Chips')
    expect { takeaway.show_order_subtotals }.to output(dummy_subtotals).to_stdout

  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

end
