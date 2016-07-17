require 'starters'

describe Starters do
  it {is_expected.to respond_to :starters_list}

  describe '#initialize' do
    subject {Starters.new}
    context 'when starters are created' do
      it 'holds a list of starters and prices in a hash' do
        subject.list
        puts "=================#{subject.starters}================"
        expect(subject.starters).to include("TomKaKai" => "£6.50")
      end
      end
  end


end
