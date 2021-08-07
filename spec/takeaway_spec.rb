require 'takeaway'

describe Takeaway do 
  let(:takeaway) { described_class.new }
  
  describe '#menu' do 
    it "Responds to menu method" do 
      expect(takeaway).to respond_to(:display_menu) 
    end

    it "Shows menu hash with list of foods/prices" do 
      expect(takeaway.display_menu.menu).to eq({:pizza=>"8.99", :noodles=>"6.99", :chips=>"3.99"})
    end 
  end 
   
end 
