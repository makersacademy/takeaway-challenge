require 'menu'

describe Menu do
  subject {described_class.new}

  it {is_expected.to respond_to :view}
end
