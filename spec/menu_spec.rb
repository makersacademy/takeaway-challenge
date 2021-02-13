require 'menu'

describe Menu do
  subject(:new_menu) { described_class.new }

  let(:dish_double) { double(:dish, :name => "pizza", :price => "10", :available => true)}
  let(:dish_class_double) { double(:dish_class, :new => :dish_double ) }

  context 'a new menu' do
    it 'starts with a full list of dishes' do
      expect(new_menu.list).to_not be_empty
    end
  end

  describe '#show' do
    it 'menu responds to show method' do
      expect(subject).to respond_to(:show)
    end
    it 'user can see dishes on menu' do
      expect { subject.show }.to output(/Pizza/).to_stdout
    end
    it 'user cannot see unavailable dishes' do
      expect { subject.show }.to_not output(/Lobster/).to_stdout
    end
  end

end
