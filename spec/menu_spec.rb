require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  it 'Creates an Menu with food' do
    expect(subject.dishes).to include({ "Pizza" => 5.48 })
  end
end
