require_relative '../lib/submission'

describe Submission do
  
  subject(:submission_class) { described_class }
  let(:empty_order) { double(:empty_order, total: 0) }
  
  it 'receives an empty Order, and raises an error' do
    error_message = "Add items to order first. Cannot submit empty order."
    expect { submission_class.new(empty_order) }.to raise_error error_message
  end

  it 'receives a valid order, and it is submitted' do
  end
end