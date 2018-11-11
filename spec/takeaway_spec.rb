require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double("menu") }
  let(:order) { double("order") }
  let(:text) { double("text") }

  before do
    allow(order).to receive(:select_dish)
    allow(order).to receive(:dishes).and_return({ :name => "Chicken Curry", :quantity => 2 })
    allow(order).to receive(:available?).and_return(true)
    allow(order).to receive(:total_cost).and_return(13.00)
    allow(text).to receive(:send).and_return("Text sent")
  end

  context '#show_menu' do
    it 'can show menu (list of dishes with prices)' do
      message = "Chicken Curry £6.5\nLamb Curry £7\nVegetable Curry £6\n"
      expect { takeaway.show_menu }.to output(message).to_stdout
    end
  end

  context '#place(order)' do
    it 'can recieve a list of dishes ordered by a customer' do
      allow(order).to receive(:nothing_selected?).and_return(false)
      takeaway.place(order)
      expect(takeaway.ordered_dishes).to eq({ :name => "Chicken Curry", :quantity => 2 })
    end

    it 'return the total cost of the order' do
      allow(order).to receive(:nothing_selected?).and_return(false)
      expect(takeaway.place(order)).to eq 13.00
    end

    it 'prevents placing an order if no dish is selected' do
      allow(order).to receive(:nothing_selected?).and_return(true)
      message = "Can't place the order: no dish selected"
      expect { takeaway.place(order) }.to raise_error message
    end
  end
end
