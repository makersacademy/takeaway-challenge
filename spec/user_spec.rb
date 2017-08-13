require 'user'

describe User do
  let(:user) { described_class.new }

  it 'runs the method for printing and creating the menu when initialized' do
    output = "1.Plastic fried virus skin: $9.99\n2.Birdpeople egg with dehydrated watermelon: $88.67\n3.Shredded concreate: $4.99\n4.Cockroach-wing encapsulated microchip: $7.97\n5.Extra powdered rocket: $2.99\n6.Ninja squirrel rolled in plastic-bag: $4.67\n"
    expect { subject.menu }.to output(output).to_stdout
  end

  it 'creates an empty array for the basket' do
    expect(subject.basket).to be_instance_of(Array)
  end

  it 'prints the instructions on how to order' do
    output = "1.Plastic fried virus skin: $9.99\n2.Birdpeople egg with dehydrated watermelon: $88.67\n3.Shredded concreate: $4.99\n4.Cockroach-wing encapsulated microchip: $7.97\n5.Extra powdered rocket: $2.99\n6.Ninja squirrel rolled in plastic-bag: $4.67\n"
    expect { subject.menu }.to output(output).to_stdout
    output2 = "Please select your order.\nTo do this please enter the number of your order from 1-6. Please press enter after each selection, and double enter when you have completed your order.\nIf you wish to order more than one of the same dish please enter this number twice, both times pressing the space bar after.\n"
    expect { subject.order_instructions }.to output(output2).to_stdout
  end

  it 'adds the order to the basket array' do
    expect { user.order_selection }.to change { user.basket }
  end

  it 'selects the correct price from the menu with the order number' do
    user.order = 3
    expect(user.accessing_price_of_order).to eq(4.99)
  end

  it 'the user can make a selection through stdin' do
    user.order_selection
    allow(user.order_selection).to receive(:gets).and_return("3")
    order = $stdin.gets
  end

  it 'summs up the total order' do

  end

  # it 'raises an error if the user does not enter a correct number' do
  #   user.order_selection.order = 9
  #   expect { user.order_error }.to raise_error("The number you have input is not an item on the menu")
  # end
  #
  # #
  # # it 'raises an error if the user does not input anything' do
  #
  # end

  # it 'saves the users selection to a file' do
  #
  # end

end
