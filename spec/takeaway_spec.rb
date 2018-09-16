require 'takeaway'

describe TakeAway do

  # let(:takeaway){double(:takeaway)}
  # before(:each) {
  #   takeaway = TakeAway.new
  # }

  # it { is_expected.to respond_to(:display_menu) }
  describe '#display_menu' do
    it 'displays the menu' do
      takeaway = TakeAway.new
      expect(takeaway.display_menu).to eq(@menu)
    end
  end

  # it { is_expected.to respond_to(:select).with(2).argument }
  describe '#select' do
    it 'selects the food items' do
      takeaway = TakeAway.new
      expect(takeaway.select("chips", 2)).to eq("You have added chips x2 portions")
    end
  end

  # it { is_expected.to respond_to(:summary) }
  describe '#summary' do
    it 'displays the order basket so far' do
      takeaway = TakeAway.new
      takeaway.select("chips", 2)
      takeaway.select("kebab", 3)
      expect(takeaway.summary).to eq([{ "chips" => 2 }, { "kebab" => 3 }])
    end
  end

  # it { is_expected.to respond_to(:complete_order) }
  describe '#complete_order' do
    it 'confirms completion of the order' do
      takeaway = TakeAway.new
      expect(takeaway.complete_order).to eq("Thankyou for your order")
    end
  end

  it { is_expected.to respond_to(:text) }
  # describe '#text' do
  #   # it 'creates an instance of the SendSMS class' do
  #   #   expect(send = SendSMS.new).to
  #   # end
  #   it 'sends a text' do
  #     send = SendSMS.new
  #     expect(send).to receive(:sms).with(0).argument
  #   end
  # end

end
