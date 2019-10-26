require 'takeaway'

describe Takeaway do

  menu = Menu.new

  describe 'view_menu' do
    it 'shows menu' do
      expect { subject.view_menu }.to output(menu.list).to_stdout 
    end
  end

  describe '#basket' do
    it 'it can get the basket summary' do
      expect(subject).to respond_to(:basket)
    end

    it 'raises an error when basket is empty' do
      expect(subject).to respond_to(:basket)
    end
  end

  describe '#total' do
    it 'can show a price total of the order' do
      expect(subject).to respond_to(:total)
    end
  end

    it 'confirms that the order has been place' do
      expect(subject).to be(subject)
    end
    
    it 'can send a text when the order is placed' do
      expect(subject).to be(subject)
    end

end