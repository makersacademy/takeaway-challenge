require 'takeaway'

describe Takeaway do
  let(:takeaway) { Takeaway.new(menu) }
  let(:menu) { double('Menu', items: { "Daniels's Delicious Chicken" => 12,
               "Eduard's Enviable Eggs" => 19,
               "Mark's Marvellous Lasagne" => 8,
               "Gabriel's Godly Fries" => 25,
               "Maria's Majestic Meatballs" => 24,
               "Rafaela's Round Halloumi" => 39,
               "Sayem's Saucy Fishcakes" => 22,
               "Valeria's Value Milkshake" => 16 },
                display: "1. Daniels's Delicious Chicken £12\n2. Eduard's Enviable Eggs £19\n3. Mark's Marvellous Lasagne £8\n4. Gabriel's Godly Fries £25\n5. Maria's Majestic Meatballs £24\n6. Rafaela's Round Halloumi £39\n7. Sayem's Saucy Fishcakes £22\n8. Valeria's Value Milkshake £16\n") 
  }

  context "#initialize" do
    it "expects the function to initalize with an basket = []" do
      expect(takeaway.basket). to eq []
    end
  end

  context '#display_menu' do
    it "expects the function to display the menu" do
      expect(takeaway.display_menu).to eq "1. Daniels's Delicious Chicken £12\n2. Eduard's Enviable Eggs £19\n3. Mark's Marvellous Lasagne £8\n4. Gabriel's Godly Fries £25\n5. Maria's Majestic Meatballs £24\n6. Rafaela's Round Halloumi £39\n7. Sayem's Saucy Fishcakes £22\n8. Valeria's Value Milkshake £16\n"
    end
  end     

  context '#list_of_options' do
    it "expects the function to list the options" do
      expect { takeaway.list_of_options }.to output("Please enter 'display_menu' to see the menu\nPlease enter 'choose(meal, quantity)' in order to order a meal\nPlease enter 'show_basket' to see your current basket\nPlease enter 'total' to see your total\nPlease enter 'checkout' to place your order\n").to_stdout 
    end
  end

  context '#choose' do

    it 'expects the function to add a default of 1 meal to the basket if no quantity value is added' do
      takeaway.choose(1)
      expect(takeaway.basket).to include({ "Daniels's Delicious Chicken" => 1 })
    end

    it "expects the function to add the meal chosen to the basket" do
      takeaway.choose(1, 3)
      expect(takeaway.basket).to include({ "Daniels's Delicious Chicken" => 3 })
    end 

    it "expects the function to return an error if the customer doesn't enter a valid dish number" do
      expect { takeaway.choose(9, 3) }.to raise_error "Please choose one of the dishes listed"
    end 
  end

  context '#show_basket' do

    it 'shows the current basket' do
      takeaway.choose(1, 3)
      takeaway.choose(5, 2)

      expect { takeaway.show_basket }.to output("Daniels's Delicious Chicken, Quantity: 3\nMaria's Majestic Meatballs, Quantity: 2\n").to_stdout
    end
  end

  context '#total' do
    it 'outputs the current total of the basket' do
      takeaway.choose(1, 3)
      takeaway.choose(5, 2)
      expect { takeaway.show_total }.to output("Your total is £84\n").to_stdout
    end
  end

  context '#checkout' do
    number = 05555555555

    it "expects the function to return an error if the customer doesn't have anything in their basket" do
      expect { takeaway.checkout(number) }.to raise_error "You have nothing in your basket!"
    end 

    it 'outputs send_sms function to be called with a phone number' do
      takeaway.choose(1, 3)
      takeaway.choose(5, 2)
      expect(takeaway).to receive(:send).with(number, 84)
      takeaway.checkout(number)
    end
  end

end
