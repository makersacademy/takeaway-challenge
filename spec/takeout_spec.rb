require 'takeout'

describe 'Takeout' do
  let(:takeout){Takeout.new}
  let(:menu){ double('menu', menu: food) }

  xit 'can place an order' do

  expect(takeout.confirm())
  end
  #
  # xit 'can alert customer by text'


end
