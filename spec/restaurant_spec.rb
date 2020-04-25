require 'restaurant'

describe Restaurant do
  subject { described_class.new(menu = menu) }
  let(:menu) { instance_double :menu }

  it { is_expected.to respond_to(:view_menu) }

  describe '#view_menu' do
    it 'returns a menu of dishes with prices' do
      expect(subject.view_menu).to eq 'Fish & Chips £4'
    end
  end
end
