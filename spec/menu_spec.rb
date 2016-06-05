require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  #it { is_expected.to respond_to :display}
  it { is_expected.to respond_to :display} and 'opens the menu'
   #expect(menu).to respond_to(:display)
  end
