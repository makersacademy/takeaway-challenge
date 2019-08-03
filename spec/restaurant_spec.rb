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
  let(:items) { double("order_items", :list => { "burger" => 2, "pasta" =>1 }) }
  let(:order) { double("order") }

  subject { described_class.new(menu) }
   
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
      allow(order).to receive(:checkout)
      expect(order).to receive :checkout
      subject.place_order
    end
  end
  
end