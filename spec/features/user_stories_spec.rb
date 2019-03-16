require 'menu'

RSpec.describe 'User_stories' do

# User story 1
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  describe '#show_dishes' do
    it 'expects menu to respond to it' do
      menu = Menu.new
      expect { menu.show_dishes }.not_to raise_error
    end

    it 'shows a list of dishes with prices' do
      menu = Menu.new
      expect { menu.show_dishes }.to output("dish1: 10\ndish2: 11\n").to_stdout
    end

  end

# User story 2
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
  describe '#select_dishes' do
    it 'allows user to use the select option with n arguments' do
      menu = Menu.new
      expect { menu.select_dishes('dish1','dish2') }.not_to raise_error
    end

    it 'selectes the only 2 available dishes' do
      menu = Menu.new
      menu.show_dishes
      menu.select_dishes('dish1','dish2','dish3')
      expect(menu.show_selected_dishes).to eq(['dish1','dish2'])
    end

  end

end