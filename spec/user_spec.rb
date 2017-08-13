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

 context "#order_selection" do
   let(:user) { described_class.new }

   it 'adds the order to the basket array' do
     expect { user.order_selection 3 }.to change { user.basket }
   end

  it 'accepts an order number and finds the correct price' do
    user.order_selection(4)
    expect(user.basket).to include 4 => 7.97 
  end

end

end

  # it 'displays the basket'
  #   user.order_selection(3)
  #   expect(user.display_basket).to output
  # end
#
#   it 'summs up the total order' do
#
#   end
#
# end
#
#
#   # it 'the user can make a selection through stdin' do
#   #   user.order_selection
#   #   allow(user.order_selection).to receive(:gets).and_return("3")
#   #   order = $stdin.gets
#   # end
#
#
#   # it 'raises an error if the user does not enter a correct number' do
#   #   user.order_selection.order = 9
#   #   expect { user.order_error }.to raise_error("The number you have input is not an item on the menu")
#   # end
#   #
#   # #
#   # # it 'raises an error if the user does not input anything' do
#   #
#   # end
#
#   # it 'saves the users selection to a file' do
#   #
#   # end
#
# end
