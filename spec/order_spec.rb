require 'order'

describe Order do
  let(:choice) { double :choice }
  let(:quantity) { double :quantity }
  let(:total) { double :total }
  it { is_expected.to respond_to(:show) }
  describe '#show' do
    it 'shows the order separated by \n and total' do
      allow(choice).to receive(:str).and_return("choice_string")
      subject.add(choice, quantity)
      subject.add(choice, quantity)
      expect(subject.show).to eq("choice_string : #{quantity}\nchoice_string : #{quantity}")
    end
  end

  describe '#add' do
    it { is_expected.to respond_to(:add).with(2).arguments }
    it 'adds an item to the list' do
      expect { subject.add(choice, quantity) }.to change { subject.order.length }.from(0).to(1)
    end
  end

  describe '#total' do
    it 'shows the total for the current order' do
      allow(choice).to receive(:price).and_return(10)
      quantity = 1
      subject.add(choice, quantity)
      subject.add(choice, quantity)
      expect(subject.total).to eq(20)
    end
  end

end
