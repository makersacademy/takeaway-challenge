require 'takeaway'

describe Takeaway do

  it 'should display a welcome message' do
    message = 'Welcome to Trelawny field, di baddest kitchen inna England!'
    expect(subject.welcome).to eq message
  end

  it 'should list dishes' do
    expect(subject.show_menu).to include(
      "ackee and saltfish £10", "callaloo and saltfish £10", 
      "jerk chicken £9", "curry goat £10",
      "fried dumplings £2", "boiled plantain £2", 
      "pepper pot stew £8", "escovitch fish £15", 
      "steamed veg £5"
    )
  end
end