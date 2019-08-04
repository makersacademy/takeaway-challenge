require 'restaurant'

describe Restaurant do

  let(:burger) { double("burger", name: "burger", price: 15) }
  let(:pasta) { double("pasta", name: "pasta", price: 10) }
  let(:sushi) { double("sushi", name: "sushi", price: 22) }
  let(:menu) { double(
    "menu",
    :dishes_list => [burger, pasta],
    :show => "burger - £15\npasta - £10"
    )
  }
  let(:items) { double("order_items", :list => { "burger" => 2, "pasta" => 1 }) }
  let(:order) { double("order", :items => items, :total_price => 40, :customer_number => "07777777777") }
  let(:summary) { "burger(£15/each) - x2 - total: £30\npasta(£10/each) - x1 - total: £10\nTOTAL: £40" }

  subject { described_class.new(menu) }

  before do
    allow(order).to receive(:checkout)
    allow(order).to receive(:paid?)
    allow(order).to receive(:confirm_payment)
    allow(subject).to receive(:notify).and_return("Text sent!")
  end
   
  describe '#menu' do
    it "has a menu" do
      expect(subject.menu).to eq menu
    end
  end

  describe '#new_order' do
    it "creates a new order" do
      expect(subject.new_order(order)).to eq order
    end    
  end

  describe '#place_order' do
    it 'calls checkout on order' do
      subject.new_order(order)
      expect(order).to receive :checkout
      subject.place_order(40)
    end

    it "raises an error if payment different from total sum" do
      subject.new_order(order)
      expect { subject.place_order(15) }.to raise_error "The payment doesn't match the total!"
    end

    it "sends a confirmation text" do
      subject.new_order(order)
      expect(subject).to receive(:notify).and_return("Text sent!")
      subject.place_order(40)
    end

    it "returns a summary of the order" do
      subject.new_order(order)
      expect(subject.place_order(40)).to eq(summary)
    end

    it "raises an error if the order has already been paid" do
      subject.new_order(order)
      allow(order).to receive(:paid?).and_return(true)
      expect{ subject.place_order(40) }.to raise_error "This order has already been paid for."
    end
  end
  
end
