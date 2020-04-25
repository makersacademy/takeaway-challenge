require 'takeaway'
require 'menu'

describe 'User Stories' do
  
  context 'TakeAway class' do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    it 'respond to menu' do
      takeaway = TakeAway.new
      expect(takeaway.menu).not_to be nil
    end

    it 'should respond to @menu' do
      takeaway = TakeAway.new
      expect(takeaway.menu).not_to be nil
    end

    it 'should print list of dishes' do
      takeaway = TakeAway.new
      expect{ takeaway.menu_list }.to output.to_stdout
    end

  end


  context 'Menu class' do
    it 'should respond to #menu' do
      menu = Menu.new
      expect { menu.print }.to output.to_stdout
    end

  end

end