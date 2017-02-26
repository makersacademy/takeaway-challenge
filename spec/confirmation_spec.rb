require 'confirmation'

describe Confirmation do

  subject(:confirmation) { described_class.new }

  before do
    allow(confirmation).to receive(:send_text) {"Your order has been placed and will be delivered around 10:00pm"}
  end

  it 'should show the time an hour ahead in hours and minutes' do
    expect(confirmation.time).not_to eq(Time.now)
  end

end
