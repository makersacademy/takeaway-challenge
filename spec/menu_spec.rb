require 'menu'

describe Menu do

  let(:pasta) {double(:item, name: "Pasta", price: 5)}
  let(:pizza) { double(:item, name: "Pizza", price: 7) }

  subject {described_class.new()}


  it 'can return list of items and prices' do
    expect(subject.check).to eq subject.items
  end

  it 'fails if empty' do
    subject.items = []
    expect{subject.check}.to raise_error "Menu empty"
  end

  describe '#select_by_name' do
    it 'selects the correct item' do
      subject.items = [pasta, pizza]
      expect(subject.select_by_name('pasta')).to eq pasta
    end
  end
end
