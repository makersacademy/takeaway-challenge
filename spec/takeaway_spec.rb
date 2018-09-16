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
    it 'prints #display on Menu' do
      allow(mockmenu).to receive(:display).and_return("test passed1")
      expect(subject.menu).to receive(:display)
      expect { subject.view_menu }.to output("test passed1").to_stdout
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
    it 'prints #display on Order' do
      allow(mockorder).to receive(:display).and_return("test passed2")
      expect(subject.order).to receive(:display)
      expect { subject.view_order }.to output("test passed2").to_stdout
    end
  end
end
