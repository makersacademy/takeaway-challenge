require 'takeaway'

describe 'User stories' do
  #   User story 1:
  #   As a customer
  #   So that I can check if I want to order something
  #   I would like to see a list of dishes with prices
  describe '#show_menu' do
    it 'so that I can check if I want to order, it shows a list of dishes with prices' do
      takeaway = Takeaway.new
      expect { takeaway.show_menu }.not_to raise_error
    end
    it 'so that I can check if I want to order, it shows a list of dishes with prices' do
      takeaway = Takeaway.new
      expect(takeaway.show_menu).to eq(Takeaway::MENU)
    end
  end
end
