require 'cart'
require 'menu'
require 'date'

describe Menu do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  describe "User story 1. I would like to see a list of dishes with prices" do

    let(:test_menu) { Menu.new }

    # Here I am replacing the long menu which usually gets loaded from 'menu.json' with a shorter but still functional menu for testing purposes
    before do
      test_menu.instance_variable_set(:@menu, { "Breakfast": [{ "name": "Breakfast Burrito", "price": 5.00 }], "Dinner": [{ "name": "Steak", "price": 9.75 }] })
    end

    it "Allows me to print the full menu, and formats it nicely" do
      expect { test_menu.print_all }.to output("\n#{"Breakfast".center(40)}\n#{"--------------------".center(40)}\n#{"Breakfast Burrito".rjust(24)}: £5.00\n\n#{"Dinner".center(40)}\n#{"--------------------".center(40)}\n#{"Steak".rjust(24)}: £9.75\n\n").to_stdout
    end

    it "Allows me to select a category from the menu to be printed, and formats it nicely" do
      expect { test_menu.print_category("Dinner") }.to output("\n#{"Dinner".center(40)}\n#{"--------------------".center(40)}\n#{"Steak".rjust(24)}: £9.75\n\n").to_stdout
    end

  end

end

describe Cart do

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  describe "User story 2. I would like to be able to select some number of several available dishes" do

    it "Allows the user to select a dish by name and add it to the cart (one dish at a time)" do
      subject.add("Cheese Pizza")
      expect(subject.items).to include({ :name => "Cheese Pizza", :price => 5.00, :quantity => 1 })
    end

    it "Allows the user to select multiple dishes to add to cart at once by passing an array of names" do
      subject.add(["New York Steak", "Soup of the Day", "Lemonade"])
      expect(subject.items).to eq [{ :name => "New York Steak", :price => 9.00, :quantity => 1 }, { :name => "Soup of the Day", :price => 3.75, :quantity => 1 }, { :name => "Lemonade", :price => 1.50, :quantity => 1 }]
    end

  end

  context "Last 2 user stories require the same setup" do

    let(:subject)  { described_class.new          }
    let(:fake_sms) { double :text_sender_instance }
    let(:time)     { Time.now                     }

    # Here I am again setting up a cart with one item in it, replacing the sms confirmations with a puts statement which says the same thing, and stubbing for time, as it included in the confirmation sent
    before do
      subject.add("Cheese Pizza")
      subject.instance_variable_set(:@sms, fake_sms)
      allow(fake_sms).to receive(:send_text) { puts "Thank you, your order has been placed! It should arrive before #{(time + (60 * 60)).strftime('%R')}" }
      allow(Time).to receive(:now).and_return(time)
    end

    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been given matches the sum of the various dishes in my order
    describe "User story 3. I would like to check that the total I have been given matches the sum of the various dishes in my order" do

      it "Requires the user to pass a matching total in order to checkout" do
        # The user must pass 5.00, as that is the price of a cheese pizza
        expect { subject.checkout(5.00) }.not_to raise_error
      end

      it "Raises an error if the user tries to pay an amount that is not equal to the cart's total" do
        expect { subject.checkout(2.50) }.to raise_error("That total was incorrect. Please input the total price of your order to confirm checkout")
      end

    end

    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
    describe "User story 4. I would like to check that the total I have been given matches the sum of the various dishes in my order" do

      it "Sends a confirmation stating delivery time if the user checks out properly" do
        expect { subject.checkout(5.00) }.to output("Thank you, your order has been placed! It should arrive before #{(time + (60 * 60)).strftime('%R')}\n").to_stdout
      end

    end

  end

end
