require 'order'

describe Order do

  describe '#view_menu' do
    it 'shows list of menu items' do
      skip
      expect(subject.view_menu).to eq menu
    end
  end

  describe '#add' do
    it { is_expected .to respond_to(:add).with(3).argument }

    it 'increases total amount by price * qty' do
      subject.add('Hummus', 1, 2)
      expect(subject.total).to eq 2
    end
  end

  it 'order total to be sum of items added' do
    subject.add('Pita', 1, 1)
    subject.add('Pita', 1, 1)
    expect(subject.total).to eq 2
  end

  
end
