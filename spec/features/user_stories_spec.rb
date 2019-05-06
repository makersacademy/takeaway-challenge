require 'menu'
require 'list'

RSpec.describe 'User_stories' do

# User story 1
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  let(:list) { List.new }
  let(:menu) { Menu.new(list) }
 
  describe '#show_dishes' do
    it 'expects menu to respond to it' do
      expect { menu.show_dishes }.not_to raise_error
    end
  end

# User story 2
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  describe '#select_dishes' do
    context 'when dishes are included' do
      it 'allows user to use the select option with n arguments' do
        expect { menu.select_dishes(['dish1', 'dish2']) }.not_to raise_error
      end

    end
  end

# User story 3
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

  describe '#total' do
    context "when correct total" do
      it 'returns the total for the 2 selected dishes' do
        menu.select_dishes([1, 2])

        # stubbing the correct_total method
        allow(menu).to receive(:check_total).and_return true
        expect(menu.total).to eq 31
      end

      it 'verifies if the order is correct' do
        menu.select_dishes([1, 2]) # selects dishes
        menu.total # creates total
        expect { menu.verify_order }.to output("Total of #{menu.total} is correct\n").to_stdout
      end

      it 'shows selected dishes' do
        selected_dish = menu.select_dishes([1])
        expect { menu.show_selected_dishes }.to output("#{selected_dish[0].name} = #{selected_dish[0].price}\nTotal: #{menu.total}\n").to_stdout
      end
    end

    context "when incorrect total" do
      it 'return an error' do
        menu.select_dishes([1, 2]) # selects dishes
        menu.total # creates total
        # stubbing the correct_total method to return false
        allow(menu).to receive(:check_total).and_return false
        expect { menu.verify_order }.to output("We have made an error\n").to_stdout
      end
    end
  end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as 
# "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  describe 'Messaging system' do
    it 'sends a message after the order is placed' do
      expected_delivery = (Time.now + 60 * 30).strftime "%H:%M"
      messaging_system = double 'Twilio'
      allow(messaging_system).to receive(:new).and_return(messaging_system)
      allow(messaging_system).to receive(:send).and_return("Thank you! Your order was placed and will be delivered before #{expected_delivery}")
      
      list = List.new
      menu = Menu.new(list, messaging_system)
      
      expect(menu.put_order).to eq "Thank you! Your order was placed and will be delivered before #{expected_delivery}"
    end
  end

end
