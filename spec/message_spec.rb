require 'message'

describe Message do

  describe "#initilize" do

    it 'should create an empty phone number' do
      expect(subject.phone_number).to be nil
    end

  end

  describe "#send_confirmation" do

    subject(:takeaway) { described_class.new }

    it 'sends a payment confirmation text message' do
      expect(takeaway).to receive(:send_confirmation)
      takeaway.send_confirmation
    end

  end

  describe '#store_phone_number' do

    it 'should store the phone number' do
      subject.store_phone_number("123456")
      expect(subject.phone_number).to eq "123456"
    end
  end

end
