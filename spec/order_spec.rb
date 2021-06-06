require 'order'
require 'menu'

describe Order do
  subject { described_class.new }
  let(:dumplings){ double :dish, price: 3.50 }
  let(:springroll){ double :dish, price: 3.50 }

  it 'has an empty basket of dishes by default' do
    expect(subject.basket).to be_empty
  end
 
  describe '#add_to_basket' do
    it { is_expected.to respond_to(:add_to_basket)}

    it ' can add dishes to basket' do
      expect(subject.add_to_basket(dumplings,2)).to eq (2)
      subject.add_to_basket(dumplings,2)
      subject.add_to_basket(springroll,2)
      expect(subject.basket).to eq ({ dumplings => 2, springroll =>2})
    end
  end

  describe '#count_item' do
    it 'can count items in your basket' do
      subject.add_to_basket(dumplings,2)
      subject.add_to_basket(springroll,2)
      expect(subject.count_item).to eq (4)
    end
  end

  describe '#total_in_basket' do
    it 'can calculate total in your basket'do
    subject.add_to_basket(dumplings,2)
    subject.add_to_basket(springroll,2)
    expect(subject.total_in_basket).to eq (14.00)
    end
  end
end