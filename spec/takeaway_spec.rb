require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  let(:menu) do
    {
      "Fish" => 2365,
      "Chips" => 1836,
      "Kebab" => 4317
    }
  end

  it 'prints a menu with prices' do
    expect(takeaway.print_menu).to eq menu
  end

end
