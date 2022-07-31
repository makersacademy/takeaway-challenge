require 'restaurant'
require 'menu'

describe Restaurant do

  describe '#initialize' do
    it 'initializes with Menu' do
      expect(subject.menu).to be_an_instance_of Menu
    end
  end

  describe '#view_menu' do
    it 'displayes the menu' do
      expect { subject.view_menu }.to output(include("Chicken burger: £10\nBeef burger: £12\n")).to_stdout 
    end
  end  

end