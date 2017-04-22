require './lib/print'

describe Print do
  alias_method :print, :subject

  it { is_expected.to respond_to(:print_menu).with(1).argument }
  it { is_expected.to respond_to(:add_to_basket).with(1).argument }
  it { is_expected.to respond_to(:view_basket).with(2).arguments }

end
