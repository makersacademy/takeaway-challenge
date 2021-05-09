require 'takeaway'
describe Takeaway do
  let (:menu) { double(:menu, items: [{name: "item_one", price: 2.50}, {name: "item_two", price: 5.00}]) }

  describe '#menu' do
    subject {described_class.new(menu)}
    it 'displays the menu' do
      expect(subject.menu).to eq(menu) 
    end
  end
end
