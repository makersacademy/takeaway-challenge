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
    expect{ subject.order_instructions }.to output(output2).to_stdout
  end

  # it 'the user can make a selection through stdin' do
  #   # expect(subject.user_selection).to eq gets.chomp
  # end

  it 'adds the order to the basket array' do
     expect { user.order_selection }.to change { user.basket }
  end

  it 'raises an error if the user does not enter a correct number' do

  end

  it 'raises an error if the user does not complete the order' do

  end

  it 'raises an error if the user does not input anything' do

  end

  it 'adds this selection to a basket' do

  end

  it 'saves the users selection to a file' do

  end

end
