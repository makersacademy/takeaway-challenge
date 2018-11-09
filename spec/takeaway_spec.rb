require 'takeaway'

describe Takeaway do

  it 'responds to .see_dishes' do
    expect(subject).to respond_to(:see_dishes)
  end

  it 'shows a list of dishes with prices' do
    expect(subject.see_dishes.length).to be > 0
  end
  
  it 'responds to .select_dish' do
    expect(subject).to respond_to(:select_dish)
  end

  it 'responds to .selected' do
    expect(subject).to respond_to(:selected)
  end

  it 'responds to .select_dish' do
    expect(subject).to respond_to(:see_dishes)
  end

end
