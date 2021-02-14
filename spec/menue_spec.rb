require_relative '../docs/lib/menue' 

describe Menue do      
  
  describe '#print_menue' do 
    it "prints the menue when called" do 
      expect(subject.print_menue).to eq(subject.menue) 
    end 
  end 
  
  describe '#look_for_dish' do 
    it "responds to 'look_for_dish' method eith 1 argument" do 
      expect(subject).to respond_to(:look_for_dish).with(1).argument
    end
 end
  
  
  
end 