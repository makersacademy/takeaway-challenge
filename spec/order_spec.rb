require 'order'

describe Order do
  describe '#order' do
    it 'adds to total cost' do
      subject.order("fries", 2)
      expect(subject.total_cost).to eq 2.58
    end

    it 'adds order to basket' do
      subject.order("fries", 2)
      expect(subject.basket).to eq ["fries (2): £2.58"]
    end

    it 'raises an error if incorrect meal is provided' do
      expect{subject.order("amburger", 2)}.to raise_error(RuntimeError, "Oops! We don't stock that meal." )
    end
  end
end
