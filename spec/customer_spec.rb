require 'customer'
require 'restaurant'

describe Customer do
  context 'Show all dishes available' do
    it { is_expected.to respond_to(:see_all_dishes).with(1).argument }
  end


end