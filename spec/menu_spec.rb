require 'menu'

describe Menu do

  it{is_expected.to respond_to(:menu)}
  it{is_expected.to respond_to(:read)}

  describe '#initialize' do
    let(:menu) {double :menu}

    it 'should create a menu containing food items and prices' do
      expect(subject.menu).to include({:king_burger => 8, :cheese_burger => 7, :chicken_burger => 7})
    end

  end

  describe '#read' do
    it 'should display the menu options' do
      expect{subject.read}.to output{@menu}.to_stdout
    end
  end



end
