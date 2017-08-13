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
     expect { user.order_selection 3 }.to change{ user.basket }
   end

   it 'accepts an order number and finds the correct price' do
     user.order_selection(4, 2)
     expect(user.basket).to include 4 => 7.97
   end

   it 'calculates the price based on order number and quantity' do
     user.order_selection(4, 2)
     expect(user.total_price_of_basket).to eq(15.94)
   end

   it 'displays the total value' do
     user.order_selection(4, 2)
     user.total_price_of_basket
     expect { user.display_basket }.to output("The total value of your basket is £ 15.94\n").to_stdout
   end

   it 'raises an error if the wrong item number is put in' do
     expect { user.order_selection(10, 2) }.to raise_error("Item does not exit")
   end

   it 'raises an error if the wrong quantity is put in' do
     expect { user.order_selection(3, 0) }.to raise_error("Item does not exit")
   end

 end
end

  # it 'displays the basket'
  #   user.order_selection(3)
  #   expect(user.display_basket).to output
  # end
