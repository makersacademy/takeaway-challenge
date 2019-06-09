require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :menu }
  let(:menu_list) { double :menu_list }

describe "#menu" do
   it 'shows a menu' do
     allow(menu).to receive(:show_menu).and_return(menu_list)
     expect(takeaway.menu).to eq menu_list
   end
end
end
