require 'takeaway'

describe Takeaway do

    subject(:takeaway) { described_class.new(menu: menu, order: order) }
    let(:menu) { double(:menu, printing: print_menu) }
    let(:order) { double(:order) }
    let(:print_menu) { "dish1: £2.50" }
    let(:dishes) { {dish1: 2.5, dish2: 3.0} }
    
    describe "#print_menu" do
        it "prints a list of dishes with prices" do
            expect(takeaway.print_menu).to eq print_menu
        end
    end

    describe "#select" do
      it "selects number of several dishes" do
        expect(order).to receive(:add).twice
        takeaway.select(dishes)
      end
    end
end