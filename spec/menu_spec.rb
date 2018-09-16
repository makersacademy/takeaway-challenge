require 'menu'

describe Menu do
  let(:mockprinter) { double(:mockprinter) }
  let(:mockdish)    { double(:mockdish, new: "new", name: "name", price: "price") }
  subject           { described_class.new(mockprinter, mockdish) }

  describe 'instantiation' do
    it 'sets @printer to mock Printer' do
      expect(subject.printer).to eq(mockprinter)
    end

    it 'sets @dish to mock Dish class' do
      expect(subject.dish).to eq(mockdish)
    end

    it 'creates Dish objects and stores in @list1' do
      allow(mockdish).to receive(:new).and_return(mockdish)
      expect(subject.list).to eq([mockdish, mockdish, mockdish])
    end
  end

  describe 'display' do
    it 'calls #display on printer' do
      allow(mockdish).to receive(:new).and_return(mockdish)
      3.times { expect(subject.printer).to receive(:display_menu) }
      subject.display
    end
  end
end
