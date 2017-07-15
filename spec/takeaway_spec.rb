require 'takeaway'

describe Takeaway do
  let(:subject) { described_class.new }

  describe '#read_menu' do
    let(:display_menu) { display_menu.each_pair { |key, value| puts "#{key.capitalize}: £#{value}" {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99,
      "peking duck"=>7.99, "fu-king fried rice"=>5.99} }

    it { is_expected.to respond_to(:read_menu) }

    it 'displays items on menu' do
      expect(subject.read_menu).to eq display_menu
    end
  end
end
