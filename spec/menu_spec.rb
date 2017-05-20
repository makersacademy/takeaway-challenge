require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'is initialized with an empty array of @Dishes' do
    expect(subject.items).to be_empty
  end
end
