require 'order'

describe Order do
  let(:order) { Order.new('LEONA') }

  before(:each) do |test|
    unless test.metadata[:skip_add_halloumi]
      order.add('halloumi wrap', 1)
    end
  end

  describe '#initialize' do
    it 'creates an empty hash to store order summary', :skip_add_halloumi do
      expect(order.summary).to be_empty
    end
  end

  describe '#add' do
    it 'takes a dish and quantity, calculates the price, and adds them to the order summary', :skip_add_halloumi do
      order.add('iced tea', 2)

      expect(order.summary).to eq({ 'iced tea' => { :quantity => 2, :price => 7.00 } })
    end

    it 'sums quantity if dish is already in the order summary' do
      expect { order.add('halloumi wrap', 1) }.to change { order.summary['halloumi wrap'][:quantity] }.from(1).to(2)
    end

    it 'sums price if dish is already in the order summary' do
      expect { order.add('halloumi wrap', 1) }.to change { order.summary['halloumi wrap'][:price] }.from(6.50).to(13.00)
    end   
    
    it 'returns the current order list' do
      expect(order.add('iced tea', 2)).to eq order.summary
    end

    it 'raises an error if user inputs a dish that is not on the menu' do
      expect { order.add('coal', 5) }.to raise_error("coal not on LEONA menu")
    end

    it 'raises an error if user does not input an integer for quantity argument' do
      expect { order.add('iced tea', 'twentyfive') }.to raise_error("please input a quantity as an integer")
    end
  end

  describe '#print_summary' do
    it 'prints the current order list to standard output' do
      order.add('iced tea', 2)

      expect { order.print_summary }.to output("1 - halloumi wrap - £6.50\n2 - iced tea - £7.00\n").to_stdout
    end
  end

  describe '#print_menu' do
    it 'prints the menu of the users chosen restaurant', :skip_add_halloumi do
      expect { order.print_menu }.to output("LEONA MENU\n**************\nhalloumi wrap - £6.50\nfish finger wrap - £6.50\nblack bean box - £6.50\nchilli chicken box - £6.50\nwarm salad - £6.00\niced tea - £3.50\nmatcha latte - £3.00\n**************\n").to_stdout
    end
  end

  describe '#checkout' do
    it 'prints the checkout summary' do
      order.add('iced tea', 2)
      order.add('halloumi wrap', 1)

      allow(order).to receive(:send_text).and_return(true)
      
      expect { order.checkout('name', '01234567891', 'postal address') }.to output("name, postal address, 01234567891\nLEONA\n**************\n2 - halloumi wrap - £13.00\n2 - iced tea - £7.00\n**************\nTOTAL: £20.00\n**************\n").to_stdout
    end
  end
end
