require 'takeaway'

describe Takeaway do
  items = { pizza: '£6', fries: '£1' }
  let(:subject) { Takeaway.new(items) }

  it 'has a menu on initialization' do
    expect(Takeaway.new.menu).to be_a(Menu)
  end

  it 'accepts menu items passed in as hash on initialization' do
    expect(subject.menu).to be_a(Menu)
  end
end
