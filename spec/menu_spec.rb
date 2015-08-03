require 'menu'

describe Menu do
  let(:dish) { double :dish }
  #before { allow(dish).to receive(:new) }

  it 'generates instances of dish' do
    subject = Menu.new
    expect(subject.all_dishes.count).to be > 0
  end

  it 'can make new dish' do
    subject = Menu.new
    subject.new_dish :beef, 6
    expect(subject.all_dishes).to include(beef: 6)
  end
end
