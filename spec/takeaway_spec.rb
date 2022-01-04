require "takeaway"

describe Takeaway do
  let(:menu) { double(:menu, :list => "Steak £20", :dishes => { "Steak" => 20 }) }
  let(:sms) { double(:sms) }
  subject(:takeaway) { Takeaway.new(menu) }

  it { is_expected.to respond_to(:show_menu, :add_to_order, :finalize_order) }

    it "has a menu" do
        expect(takeaway).to have_attributes(:menu => menu)
    end

    describe '#show_menu' do
        it "shows the menu" do
            expect { takeaway.show_menu }.to output("Steak £20").to_stdout 
        end
    end
    
    describe '#add_to_order' do
        context 'when the correct item is selected' do
            it "begins an order" do
                takeaway.add_to_order("Steak")
                expect(takeaway.instance_variable_get(:@current_order)).to be_truthy
            end
        end
        context "when the dish does'nt exist" do
            it "returns a error" do
                expect { takeaway.add_to_order("Ham") }.to raise_error("Sorry, dish is not available")
            end
        end
    end

    describe '#finalize_order' do
        context 'when order is complete' do
            it "send sms message" do
                allow(sms).to receive(:send_sms)
                takeaway.add_to_order("Steak")
                expect(sms).to receive(:send_sms)
                takeaway.finalize_order(sms)
            end
        end
    end
  
end 