require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:takeaway) { double :takeaway}


  it 'contains an empty @basket' do
    o = described_class.new()
    expect(o.basket).to be_empty
  end

  describe '#show_basket' do
    let(:menu_item_1) { double :menu_item }
    let(:menu_item_2) { double :menu_item }
    it 'lists the items inside the basket' do
      o = described_class.new()
      o.basket <<  menu_item_1
      o.basket <<  menu_item_2
      allow(menu_item_1).to receive(:format_item).and_return("MenuItem StandIn 1")
      allow(menu_item_2).to receive(:format_item).and_return("MenuItem StandIn 2")
      expect { o.show_basket }.to output("MenuItem StandIn 1\nMenuItem StandIn 2\n").to_stdout
    end

  end  

end
