require 'customer'
require 'restaurant'

describe Customer do

  let (:restaurant)  { double(:restaurant) }

  before(:example) do
    allow(restaurant).to receive(:dishes).and_return( {
      :Rice => 1.50,
      :Naan => 2.00
      } )
  end

  context 'Show all dishes available' do
    it { is_expected.to respond_to(:see_all_dishes).with(1).argument }
  end

  context 'Dish selection' do

    it { is_expected.to respond_to(:select).with(3).argument }
    it { is_expected.to respond_to(:order) }

    it 'Can select an available dish' do
      subject.select("Naan", 1, restaurant)
      expect(subject.order).to eq [["Naan", 2.0]]
    end

    it 'Cannot select a dish not listed' do
      expect { subject.select("Pizza", 1, restaurant) }.to raise_error
    end

    it 'Can select multiple dishes' do
      subject.select("Naan", 1, restaurant)
      subject.select("Rice", 2, restaurant)
      expect(subject.order).to eq [["Naan", 2.0], ["Rice", 1.5], ["Rice", 1.5]]
    end
  end

  context 'Show current order' do
    it { is_expected.to respond_to(:current_order) }
    it { is_expected.to respond_to(:totals) }
    it { is_expected.to respond_to(:total_cost) }

    it 'and display total cost' do
      subject.select("Rice", 1, restaurant)
      subject.select("Naan", 1, restaurant)
      expect(subject.total_cost).to eq 3.50
    end

    it 'and display totals' do
      subject.select("Rice", 1, restaurant)
      subject.select("Naan", 1, restaurant)
      expect(subject.totals).to eq 'Total, 2 items at £3.50'
    end

    it 'with no cost when nothing has been ordered' do
      expect(subject.total_cost).to eq 0
    end
  end

end