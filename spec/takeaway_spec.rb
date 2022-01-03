require 'takeaway'
describe Takeaway do
    let(:takeaway) {Takeaway.new}
    let(:items) { double(name: 'name', price: 'price') }

    it {is_expected.to respond_to(:menu_items)}

    describe '#print_menu' do

    it 'shows dishes with prices' do
      2.times { takeaway.menu_items << items }
      expect(takeaway.print_menu).to eq 'name : price / name : price'
    end
  end
end