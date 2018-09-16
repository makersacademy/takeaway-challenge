require 'takeaway'

describe Takeaway do
  let(:mockorder)   { double(:mockorder) }
  let(:mockmenu)    { double(:mockmenu) }
  let(:mocksender)  { double(:mocksender) }
  subject           { described_class.new(mockmenu, mockorder, mocksender) }

  describe 'instantiation' do
    it 'menu is set to mock menu' do
      expect(subject.menu).to eq(mockmenu)
    end

    it 'order is set to mock order' do
      expect(subject.order).to eq(mockorder)
    end

    it 'sender is set to mock sender' do
      expect(subject.sender).to eq(mocksender)
    end
  end

  describe '#view_menu' do
    it 'calls #display on Menu' do
      allow(mockmenu).to receive(:display)
      expect(subject.menu).to receive(:display)
      subject.view_menu
    end
  end

  describe '#add' do
    it 'calls #add on Order' do
      allow(mockorder).to receive(:add)
      expect(subject.order).to receive(:add)
      subject.add("Chips")
    end
  end

  describe '#view_order' do
    it 'calls #display on Order' do
      allow(mockorder).to receive(:display)
      expect(subject.order).to receive(:display)
      subject.view_order
    end
  end

  describe '#checkout' do
    before do
      allow(mocksender).to receive(:send)
    end

    context 'user enters exact amount' do
      before { allow(mockorder).to receive(:check_total).and_return(true) }
      it 'calls #send on Sender' do
        expect(subject.order).to receive(:check_total)
        expect(subject.sender).to receive(:send)
        subject.checkout(3)
      end
    end

    context 'user does not enter exact amount' do
      before { allow(mockorder).to receive(:check_total).and_return(false) }
      it 'raises error' do
        expect { subject.checkout(3) }.to raise_error("Please enter exact amount!")
      end
    end
  end
end
