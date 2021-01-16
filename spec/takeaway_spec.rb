require 'takeaway'

describe Takeaway do
    subject(:takeaway) { menu: menu}
    let(:menu) { double(:menu) }
    it 'lists the items on the menu' do
        expect(subject.list_menu).to eq("Pizza: £5.00")
    end
end
