require 'spec_helper'

describe Printer do
  subject(:printer) { described_class.new }
  it 'responds to #print' do
    expect(printer).to respond_to(:print)
  end
end
