require_relative '../lib/order_server'

describe OrderServer do

  subject(:order_server) { described_class.new }

  it "raises no error on start up" do
    expect{ described_class.new }.not_to raise_error
  end
end
