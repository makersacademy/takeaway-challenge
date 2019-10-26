require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, list: list_menu) }
  let(:list_menu) {"Katsu curry: £10"}

  it 'lists items in menu and their prices' do
  expect(takeaway.list_menu).to eq("Katsu curry: £10")
  end
end
