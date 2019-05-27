require 'takeaway'

  describe Takeaway do
    subject         { Takeaway.new }
    let(:order)     { double :order }

    it 'can respond to a method that checkouts order' do
      expect(subject).to respond_to(:checkout)
    end

    it 'completes checkout and displays order total' do
      allow(order).to receive(:add).with("pizza").and_return({"pizza"=>1})
      allow(order).to receive(:display_total).and_return("Your order total is £5.99")
      expect(Takeaway.new(order).checkout).to eq("Your order total is £5.99")
    end

    # it 'sends text on order completion' do 
  end