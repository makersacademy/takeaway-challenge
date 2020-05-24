require 'message'

describe Message do
  it ' Should have a message class' do
    expect(Message).to respond_to(:new)
  end
end
