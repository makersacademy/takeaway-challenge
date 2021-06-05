require 'dish'

describe Dish do
  let(:name) { "McNuggets" }
  subject { described_class.new(name) }

  it 'has a name' do
    expect(subject.name).to eq name
  end

end
