require 'takeaway'

RSpec.describe Takeaway do
  # let (:menu_list) { double :menu_list }

  it 'shows a list of dishes with prices' do
  expect(subject.menu).to_not be_empty
  end
end
