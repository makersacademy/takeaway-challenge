require 'sms'

describe SMS do

  # ------------------------------------ DOUBLES -------------------------------------

  let(:time) { double("Time") }

  # --------------------------------- NAMED SUBJECT ----------------------------------

  subject(:sms) { described_class.new(time) }

  # ---------------------------------- ACTUAL TESTS ----------------------------------

  it 'should respond to the method send_text' do
    expect(sms).to respond_to(:send_text)
  end

end
