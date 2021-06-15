require 'takeaway'
describe Takeaway do
  it 'can display list of menu items and prices' do
    expect(subject.menu).to eq(subject.menu_items)
  end
end
