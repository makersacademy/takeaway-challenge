require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double(:menu) }

  describe '#select_food' do
  end

  describe '#show_total' do
    it 'shows that no orders have been put if the case' do
      expect { order.show_total }.to output("Welcome to Veg-E! What will your order be?\n\n--------------\nTotal price: £0\n").to_stdout
    end
    it 'shows an order and calculated total if orders have been placed' do
      # allow(order).to receive(:select_food).and_return(puts "2x bread: £6")
      # expect { order.show_total }.to output("2x bread: £6\n--------------\nTotal price: £0\n").to_stdout
    end
  end
end
