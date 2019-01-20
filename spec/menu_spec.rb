require 'menu'

describe Menu do
  it { is_expected.to respond_to :dishes_and_prices }
  it { is_expected.to respond_to :see_menu }
end