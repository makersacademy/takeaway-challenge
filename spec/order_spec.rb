require 'order'
require 'current_order'

describe Order do

  it 'sets the status of order to running' do
    subject.start
    expect(subject).to be_running
  end

end
