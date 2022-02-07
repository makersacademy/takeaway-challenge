 require_relative '../lib/takeaway.rb'

describe Takeaway do
  let(:dishes) {[{:Burger=>"£10"}, {:Fries=>"£3"}]}
  let(:order) {["Burger"]}
  
  describe '#show_menu' do
    it 'shows a list of all the dishes and their prices' do 
      expect(subject.show_menu).to eq dishes
    end
  end

  describe '#add_to_order' do
    it 'adds selected dishes to the order' do
      subject.add_to_order("Burger")
      expect(subject.order).to eq order
    end
  end
end