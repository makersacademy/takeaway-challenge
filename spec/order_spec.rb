require 'order'

describe Order do
  it { is_expected.to be_instance_of(Order)}

  # it 'should include an array to store the meals a customer has selected' do
  #   expect(subject).to include(:selection)

  describe '#view_menu' do
    describe 'show menu' do
			it 'should show dishes that can be purchased in an array of hashes' do
        expect(subject.view_menu).to eq (Menu.new.view_menu)
      end
    end
  end

  describe '#add dishes' do
    describe 'add dish' do
      it 'should change the order by adding a dish to it' do
        expect { subject.add(1) }.to change(subject, :selection)
      end
    end

    describe 'add dish' do
      it 'should add the cost of that dish to the total' do
        expect {subject.add(1) }.to change(subject, :total)
      end
    end
  end
end
