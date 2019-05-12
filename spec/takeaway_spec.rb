require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new }

  it { is_expected.to respond_to(:view_menu) }

end
