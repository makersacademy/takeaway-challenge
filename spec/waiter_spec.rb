require 'waiter'

describe Waiter do
  it 'should greet a new customer' do
    expect{ subject.greet }.to output("Hello\n").to_stdout
  end
end