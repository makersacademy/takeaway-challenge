 require_relative '../lib/takeaway.rb'

describe Takeaway do
  describe '#menu' do
    let(:dishes) {[{:Burger=>"£10"}, {:Fries=>"£3"}]}
    
    it 'shows a list of all the dishes and their prices' do 
      expect(subject.show_menu).to eq dishes
    end
  end
end