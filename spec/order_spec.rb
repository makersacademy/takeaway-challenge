require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:takeaway) { double :takeaway }
  let(:menu_item_1) { double :menu_item }
  let(:menu_item_2) { double :menu_item }

  it 'contains an empty @basket' do
    expect(order.basket).to be_empty
  end

  context 'there are menu items in the basket' do
    before :each do
      order.basket[menu_item_1] = 2
      order.basket[menu_item_2] = 3
    end

    describe '#show_basket' do
      it 'lists the items inside the @basket' do
        allow(menu_item_1).to receive(:format_item).and_return("MenuItem StandIn 1")
        allow(menu_item_2).to receive(:format_item).and_return("MenuItem StandIn 2")
        expect { order.show_basket }.to output("MenuItem StandIn 1 x 2\nMenuItem StandIn 2 x 3\n").to_stdout
      end
  
      describe '#calculate_total_price' do
        it 'adds up the prices of all items in the basket' do
          allow(menu_item_1).to receive(:price).and_return(2)
          allow(menu_item_2).to receive(:price).and_return(1.50)
          expect { order.calculate_total_price }.to output("Total: £8.50\n").to_stdout
        end
      end
  
      describe '#calculate_subtotals' do
        dummy_subtotals = <<-HEREDOC
DummyItem 1 x 2: £4.00
DummyItem 2 x 3: £4.50
        HEREDOC
        it 'adds up the subtotals for the quantities of each ordered item' do
          allow(menu_item_1).to receive(:name).and_return('DummyItem 1')
          allow(menu_item_2).to receive(:name).and_return('DummyItem 2')
          allow(menu_item_1).to receive(:price).and_return(2)
          allow(menu_item_2).to receive(:price).and_return(1.50)
          expect { order.calculate_subtotals }.to output(dummy_subtotals).to_stdout
        end
      end
  
    end 
  
  end 

end
