require 'basket'

describe Basket do
  let(:bibimbap) { double :bibimbap }
  let(:naengmyeon) { double :naengmyeon }
  it 'initializes with an empty basket to store items and prices' do
    expect(subject.basket).to eq([])
  end

  context "adding items to basket" do
    before do
      subject.add_item({bibimbap=>10.50})
    end
    it 'adds an item and price to the basket' do
      expect(subject.basket).to eq([{bibimbap=>10.50}]) 
    end
    it 'adds multiple items and prices to the basket' do
      subject.add_item({naengmyeon=>8.00})
      expect(subject.basket).to eq([{bibimbap=>10.50}, {naengmyeon=>8.00}]) 
    end
  end

  context "show basket and the price with total" do
    before do
      subject.add_item({bibimbap=>10.50})
      subject.add_item({naengmyeon=>8.00})
    end
    describe '#show_basket' do
      it 'shows the items with prices' do
        expect(subject.show_basket).to eq(bibimbap => "£10.50", naengmyeon => "£8.00")
      end
    end
    describe '#print_order' do
      it 'prints the basket and the total' do
        expect { subject.print_order }.to output("[#<Double :bibimbap>, \"£10.50\", #<Double :naengmyeon>, \"£8.00\"]. Total: £18.50\n").to_stdout
      end
    end
  end
  
  context "#place_order" do
    it 'sends a text confirming the order and the total'
  end

end
