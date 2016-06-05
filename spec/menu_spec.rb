require 'menu'

describe Menu do

  let(:to_s) {double(:to_s)}
  subject(:menu) {described_class.new}

  describe '#to_s' do
    it 'displays the menu' do
      expect(menu).to respond_to :to_s
    end
  end
end
