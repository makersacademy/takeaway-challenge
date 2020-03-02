require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe '.display' do
    it { is_expected.to respond_to :display }
    it 'to return an array of item number, dish name and price' do
      expect { menu.display }.to output(/pizza/).to_stdout
      expect { menu.display }.to output(/10.50/).to_stdout
    end
  end

end
