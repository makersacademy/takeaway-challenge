require 'menu'

describe Menu do
  it 'creates an instance of Menu' do
    expect(subject).to be_an_instance_of(Menu)   
  end

  it { is_expected.to respond_to(:view) }

  describe '#view' do
    it 'will output the menu' do
        expect(subject.view).to eq({:Burger => 5.00, :Pizza => 4.00, :Fish => 6.00, :Chicken => 5.00})
    end
  end
end