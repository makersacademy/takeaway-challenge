require 'takeaway'

feature 'Feature test' do
  let(:weather) { double :weather }
  let(:takeaway) { Takeaway.new }

  scenario 'orders some delicious takeaway from Hangover Palace' do
    sets_up_takeaway
  end

  def sets_up_takeaway
    expect(takeaway.check_basket).to be_empty
    takeaway.add('Rare Chicken', 2)
    takeaway.add('Questionable sauce')
    expect(takeaway.check_basket).not_to be_empty
  end

  
end
