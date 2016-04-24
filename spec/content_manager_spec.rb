require 'content_manager'

describe ContentManager do
  let(:customer) {double :customer, name: "Sergio", phone: "+441234567890"}
  subject(:cm) { described_class.new(customer) }
  context('on initialization') do
    it 'responds to customer' do
    expect(cm).to respond_to (:customer)
    end
  end

  context('#delivery_time') do
    before do
      @fake_time =  Time.new(2000,1,1,12,25)
      allow(Time).to receive(:now).and_return(@fake_time)
      @delivery_time = Time.new(2000,1,1,13,25)
    end
    it 'if order received at 12:25, delivery before 13:25' do
      expect(cm.delivery_time).to eq @delivery_time
    end
  end

  context ('#generate_body_msg') do
    it 'message has the cost of the order' do
      msg = "Thank you for your order 4€"
      expect(cm.body_msg(4)).to include ("4€")
    end

    it 'message has name of the customer' do
      msg= "Hi Sergio, thank you for your order"
      expect(cm.body_msg(5)).to include(customer.name)
    end
  end
end