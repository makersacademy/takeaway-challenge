require_relative '../docs/lib/menue' 

describe Menue do      
  
  describe '#print_menue' do 
    it "prints the menue when called" do 
      expect(subject.print_menue).to eq(subject.menue) 
    end 
  end 
  
#  describe '#look_for_dish' do 
#    it "finds dishes containing search terms" do 
#      expect(subject.look_for_dish("Pad")).to include("Pad Thai")
#    end
#
# end
  
  
  
end 