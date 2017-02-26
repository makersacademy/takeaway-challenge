require 'confirmation'

describe Confirmation do

  subject(:confirmation) { described_class.new }

  before do
    allow(confirmation).to receive(:message) {"Your order has been placed and "}
  end
end
