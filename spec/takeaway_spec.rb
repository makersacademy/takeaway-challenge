require 'takeaway'

describe Takeaway do 
  let(:takeaway) { described_class.new }
  let
  describe '#menu' do 
   
    it "Shows menu hash with list of foods/prices" do 
      expect(takeaway.display_menu.menu).to eq(Menu.new.menu)
    end 
  end 
   
end 
