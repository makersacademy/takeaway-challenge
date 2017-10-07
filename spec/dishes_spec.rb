require 'dishes'

describe Dishes do
  subject(:dishes) { described_class.new }

  it { is_expected.to respond_to :list }

  it 'is initialsed with a menu' do
    expect(dishes.list).to eq({})
  end
end
