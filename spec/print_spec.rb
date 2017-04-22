require './lib/print'

describe Print do
  alias_method :print, :subject

  it { is_expected.to respond_to(:print_dishes) }

end
