# frozen_literial_string: true

require 'takeaway'

RSpec.describe TakeAway do
  let(:output) { StringIO.new }
  let(:takeaway) { described_class.new(output) }

  it 'has a menu' do
    result = takeaway.instance_variable_get(:@menu)

    expect(result).to eq(menu)
  end

  describe '#read_menu' do
    it { expect(takeaway).to respond_to(:read_menu) }

    it 'prints dishes with prices' do
      takeaway.read_menu

      expect(output.string).to include("spring roll: £0.99
char sui bun: £3.99
pork dumpling: £2.99
peking duck: £7.99
fu-king fried rice: £5.99")
    end
  end

  def menu
    {
      'spring roll' => 0.99,
      'char sui bun' => 3.99,
      'pork dumpling' => 2.99,
      'peking duck' => 7.99,
      'fu-king fried rice' => 5.99
    }
  end
end
