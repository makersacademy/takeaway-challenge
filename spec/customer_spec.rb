require 'customer.rb'

describe Customer do 
  subject(:customer) { described_class.new }
  let(:menu) { double :menu }

  describe '#view_menu' do
    it 'can be called by the customer' do 
      expect { customer.view_menu }.not_to raise_error
    end

    it 'when called it returns a list of items available' do
      expect(customer.view_menu).to be_instance_of(Array)
    end

    it 'can ask Menu for a list of the items' do
      allow(menu).to receive(:view_menu).and_return(["Chicken Curry", "Spring rolls", "Beef Noodles"])
      expect(customer.view_menu).to include("Chicken Curry")
    end
  end

end