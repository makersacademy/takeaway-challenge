require 'customer'
require 'restaurant'

describe Restaurant do
  context 'Can show a list of available dishes' do
    it { is_expected.to respond_to (:dishes) }
  end
end