require 'menu'

describe Menu do
  it "Contains an instance variable 'menu'" do
    expect(subject).to respond_to(:menu)
  end
end
