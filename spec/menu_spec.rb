require 'menu'

describe Menu do
  it 'should be a hash' do
    expect(subject.items.class).to eq Hash
  end

  it 'should contain symbols and integers as key value pairs' do
    expect(subject.items.all? {|k,v| k.class == Symbol && v.class == Fixnum}).to be true
  end
end
