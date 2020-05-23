# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
require 'menu'

describe Menu do
  it 'Should have a menu class' do
    expect(Menu).to respond_to(:new)
  end

  it 'Should load an array when initialized' do
    expect(subject.menu).to be_instance_of(Array)
  end
end
