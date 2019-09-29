require 'takeaway'

describe Takeaway do

  let(:test_menu_list) { "MENU:\nItem 1 -- Price\nItem 2 -- Price" }
  let(:menu) { double :menu, view_items: test_menu_list }
  subject(:takeaway) { described_class.new(menu) }

  describe '#initialize' do
    it { expect(takeaway.menu).to eq menu }
  end

  describe "#view_menu" do
    it { expect(takeaway.view_menu).to eq test_menu_list }
  end

  describe '#make_order' do

  end


end
