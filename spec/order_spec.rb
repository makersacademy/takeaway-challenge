require 'order'
require 'menu'

describe Order do
  it 'checks method select_dish exists' do
    expect(subject).to respond_to(:select_dish)
  end



end
