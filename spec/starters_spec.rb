require 'starters'

describe Starters do
  it {is_expected.to respond_to :list}
  it {is_expected.to respond_to :starters}

  describe '#initialize' do
    subject{Starters.new}
    context 'when starters are created' do
      it 'holds a list of starters and prices in a hash' do
        expect(subject.starters).to include("TomKaKai" => 6.5)
      end
      end
  end


end
