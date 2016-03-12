require 'takeaway'

describe Takeaway do

  subject(:takeaway){described_class.new}
  it{is_expected.to respond_to(:customers, :orders)}

  
end
