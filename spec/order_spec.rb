require './lib/order'

describe Order do
  alias_method :order, :subject

  it { is_expected.to respond_to(:add) }

end
