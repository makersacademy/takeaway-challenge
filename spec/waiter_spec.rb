require 'waiter'

describe Waiter do
  context 'should greet a new customer' do
    expect(subject.greet).to include("Hello")
  end
end