require 'menu'

describe Menu do 

  it 'checks that a class exists' do
    expect(subject).to be_a Menu
  end

  describe '#display_menu' do
    it 'displays a menu' do
      expect(subject).to respond_to :display_menu
    end
  end 
end 

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
