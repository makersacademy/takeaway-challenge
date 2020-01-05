require 'customer'



describe Customer do

  let(:order) { double(:order) }
  let(:order2) { double(:order2) }
  let(:menu) { double(:menu) }
  let(:send_sms) { double(:send_sms) }
  

  before(:each) do
    allow(order).to receive(:add).and_return(true)
    allow(order).to receive(:submit).and_return(true)
    allow(menu).to receive(:items).and_return({ 
      1 => ['rice', 1], 
      2 => ['chicken', 4], 
      3 => ['noodles', 2],  
      4 => ['soup', 2], 
      5 => ['prawn crackers', 1]
    })
    allow(send_sms).to receive(:send).and_return("text sent")
  end


  describe '#add_items' do
    it "adds items to order if order is empty" do
      allow(order).to receive(:status).and_return("empty")
      subject = Customer.new(menu, send_sms, order)
      expect(subject.add_items).to eq(true)
    end

    it "adds items to order if order is awaiting submission" do
      allow(order).to receive(:status).and_return("awaiting submission")
      subject = Customer.new(menu, send_sms, order)
      expect(subject.add_items).to eq(true)
    end

    it "raises error if order already submitted" do
      allow(order).to receive(:status).and_return("submitted")
      subject = Customer.new(menu, send_sms, order)
      expect{subject.add_items}.to raise_error("order already submitted")
    end
  end

  describe '#new_order' do
  it "updates current order to the new order" do
    allow(order).to receive(:status).and_return("empty")
    subject = Customer.new(menu, send_sms, order)
    subject.add_items
    subject.new_order(order2)
    expect(subject.current_order).to eq(order2)
  end
end

  describe '#submit_order' do
    it "sends a text" do
      allow(order).to receive(:status).and_return("awaiting submission")
      subject = Customer.new(menu, send_sms, order)
      expect(subject.submit_order).to eq("text sent")
    end
  end


end