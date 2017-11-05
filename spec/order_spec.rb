require 'order'

describe Order do
  subject(:subject) { described_class.new }

  let(:items) do [
                  { item: 'Chicken', price: 5},
                  { item: 'Burger', price: 4}
                ]
                end

  describe '#total' do
    it 'calculates totals from prices' do
      expect(subject.total(items)).to eq(9)
    end
  end

  describe '#check_total' do
    it 'checks against previous total' do
      expect(subject.check_total(items, subject.total(items)))
        .to eq(subject.total(items))
    end

    it "should raise error if totals don't match" do
      expect { subject.check_total(items, 6) }.to raise_error('Wrong total!')
    end
  end
end
