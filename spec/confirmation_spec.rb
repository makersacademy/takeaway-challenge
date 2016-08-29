require 'confirmation'

describe Confirmation do

  subject(:confirmation) { described_class.new }

  it{is_expected.to respond_to(:send_message)}

end
