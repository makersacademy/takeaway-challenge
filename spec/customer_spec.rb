require 'customer'

describe Customer do
  it {is_expected.to respond_to(:basket)}

  describe '#read_menu' do
    it 'will display menu' do
      expect(subject).to respond_to(:read_menu)
    end
  end

  describe '#add' do
    it 'allows subject to place dish in basket' do
      subject.add 'spring roll', 2
      expect(subject.basket).to eq({'spring roll' => 2})
    end

    it 'notifies subject that dish has been placed in basket' do
      notification = "2x spring roll(s) added to your basket."
      expect(subject.add 'spring roll', 2).to eq notification
    end

    it 'does not allow orders of alien dishes' do
      expect{subject.add('steak', 2)}.to raise_error(
      'That dish is not on our menu.')
    end
  end

  describe '#total' do
    it 'will calculate subject total' do
      subject.add 'peking duck', 2
      subject.add 'spring roll', 5
      expect(subject.total).to eq "Total: £20.93"
    end
  end

  describe '#basket_summary' do
    it 'will display summary of subject basket' do
      subject.add 'peking duck', 2
      subject.add 'spring roll', 5
      expect(subject.basket_summary).to eq(
      "peking duck x2 = £15.98, spring roll x5 = £4.95")
    end

    it 'will fail is basket empty' do
      expect{subject.basket_summary}.to raise_error(
      'Your basket is empty, order something!')
    end
  end

  describe '#checkout' do
    let(:text_api) {double :api}
    before do
      allow(subject).to receive(:text_provider) {text_api}
    end

    it {is_expected.to respond_to(:checkout).with(1).argument}

    it 'will fail if subject is trying to dupe' do
      subject.add 'peking duck', 2
      subject.add 'spring roll', 5
      expect{subject.checkout(5.00)}.to raise_error(
      'Please input the correct amount or more :)')
    end

    it 'sends a payment confirmation text message' do
      expect(text_api).to receive(:send_sms)
      text_api.send_sms(20.93)
    end

    it 'notifies subject that their order has been received' do
      allow(text_api).to receive(:send_sms)
      notification = 'Your order has been received, you should get a'\
      ' confirmation text soon.'
      expect(subject.checkout(20.93)).to eq notification
    end
  end
end
