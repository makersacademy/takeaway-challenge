require 'notifier'

describe Notifier do

  it 'checks if class exists' do
    expect(subject).to be_a Notifier
  end
end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as 
# "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
