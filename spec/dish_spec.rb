require 'dish'

describe Dish do
  it 'should make dishes with a name' do
    expect(subject.name).to be_a(String)
  end
end