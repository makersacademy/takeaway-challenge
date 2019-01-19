require 'text'

RSpec.describe Text do
  it 'accepts a hash as arguments' do
    is_expected.to respond_to(:send_confirmation).with(1).argument
  end

end
