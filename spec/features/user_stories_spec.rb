require 'takeaway'
require 'menu'

describe 'User Stories' do
  let(:takeaway) { takeaway = TakeAway.new }
  
  context 'TakeAway class' do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    it 'respond to menu' do
      expect(takeaway.menu).not_to be nil
    end

    it 'should respond to @menu' do
      expect(takeaway.menu).not_to be nil
    end

    it 'should print list of dishes' do
      expect{ takeaway.menu_list }.to output.to_stdout
    end

    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes


  end


  context 'Menu class' do
    it 'should respond to #menu' do
      menu = Menu.new
      expect { menu.print }.to output.to_stdout
    end

  end

end