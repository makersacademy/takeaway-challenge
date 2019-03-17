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
        expect { menu.select_dishes('dish1', 'dish2') }.not_to raise_error
      end

      it 'selectes the only 2 available dishes' do
        expect(menu.select_dishes('dish1', 'dish2', 'dish3')).to eq([{:dish=>"dish1", :price=>10}, {:dish=>"dish2", :price=>11}])
      end
    end

    # context 'when asking for non existing dishes' do
    #   it 'raises an error' do
    #     expect { menu.select_dishes('dish1', 'dish2','dish3') }.to raise_error 'Dish not included'
    #   end
    # end
  end

# User story 3
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

  describe '#total' do
    context "when correct total" do
      it 'returns the total for the 2 selected dishes' do
        menu.select_dishes('dish1', 'dish2')
        # stubbing the correct_total method
        allow(menu).to receive(:check_total).and_return true
        expect(menu.total).to eq 21
      end

      it 'verifies if the order is correct' do
        menu.select_dishes('dish1', 'dish2') # selects dishes
        menu.total # creates total
        expect(menu.verify_order).to be true # checks if total is correct
      end
    end

    context "when incorrect total" do
      it 'return an error' do
        menu.select_dishes('dish1', 'dish2') # selects dishes
        menu.total # creates total
        # stubbing the correct_total method to return false
        allow(menu).to receive(:check_total).and_return false
        expect(menu.verify_order).to be false
        # implement return of error messsage
      end
    end
  end 

end
