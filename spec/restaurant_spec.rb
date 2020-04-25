require 'restaurant'

describe Restaurant do
  subject { described_class.new(menu) }
  let(:menu) { instance_double 'Menu' }

  it { is_expected.to respond_to(:view_menu) }

  describe '#view_menu' do
    it 'returns a menu of dishes with prices' do
      allow(menu).to receive(:print_menu).and_return('Fish & Chips £4')
      expect(subject.view_menu).to eq 'Fish & Chips £4'
    end
  end
end
