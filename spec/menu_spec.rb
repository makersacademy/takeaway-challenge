require 'menu'

describe Menu do
  it 'should be a hash' do
    expect(subject.list.is_a?(Hash)).to be(true)
  end
end
