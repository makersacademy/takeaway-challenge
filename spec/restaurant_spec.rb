require 'restaurant'

describe Restaurant  do
  context 'can show the menu of available dishes' do
    it { is_expected.to respond_to(:menu) }
  end
end