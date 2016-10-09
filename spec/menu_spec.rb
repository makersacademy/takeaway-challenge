require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe 'initialization' do
    it 'will display a list of dishes with prices' do
      expect(subject).to eq menu
    end
  end
end
