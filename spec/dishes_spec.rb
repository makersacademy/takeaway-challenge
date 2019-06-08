require 'dishes'

RSpec.describe Dishes do
  subject(:dishes) { described_class.new }

  it { is_expected.to respond_to(:price_list) }

  end
