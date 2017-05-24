require './lib/menu.rb'

describe Menu do
  let(:menu) { described_class.new }

  describe '#initialize' do
    it 'is initialized with menu' do
      expect(menu.menu).to eq menu.menu
    end
  end

    describe "#extracts_starters" do
      it 'lists starters from menu' do
        expect { menu.extracts_starters }.to output(/Starters: 1. Olives = £4, 2. Pitta bread = £5/).to_stdout
      end
    end

    describe "#extracts_main_course" do
      it 'lists main courses from menu' do
        expect { menu.extracts_main_course }.to output(/Main Courses: 3. Fried duck = £12, 4. Fish & Chips/).to_stdout
      end
    end

    describe "#extracts_dessert" do
      it 'lists desserts from menu' do
        expect { menu.extracts_dessert }.to output(/Desserts: 5. Jam roll = £5, 6. Apple crumble = £6/).to_stdout
      end
    end

end
