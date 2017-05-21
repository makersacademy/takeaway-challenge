require 'menu'

describe Menu do

  it { is_expected.to respond_to :dishes }

  describe '#show_menu' do
    it 'should show a food type and its price' do
      subject.instance_variable_set("@dishes", [{ "edemame" => 3 }])
      expect(subject.show_menu).to eq [{ "edemame" => 3 }]
    end

    xit 'should show a food type and its price in a readable way' do
      subject.instance_variable_set("@dishes", [{ 'generic_food' => 5 }])
      expect(subject.show_menu).to eq "1. 'generic_food', £5.00"
    end
  end

  describe '#order' do
    it 'has an empty array, @current order' do
      expect(subject.current_order).to eq []
    end

    it 'should copy an item from @dishes to @current_order'do
      subject.instance_variable_set("@dishes", [{ 'generic_food' => 5 }, { 'another_food' => 10 } ])
      subject.order(2)
      expect(subject.current_order).to eq [{ 'another_food' => 10 }]
    end
  end

end
