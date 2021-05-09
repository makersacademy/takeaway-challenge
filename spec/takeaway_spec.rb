require 'takeaway'
describe Takeaway do
  let (:menu) { double(:menu, items: [{name: "item_one", price: 2.50}, {name: "item_two", price: 5.00}]) }
  subject {described_class.new(menu)}

  describe '#menu' do
    it 'displays all items on menu' do
      expect(subject.menu).to eq(menu) 
    end
  end
end
