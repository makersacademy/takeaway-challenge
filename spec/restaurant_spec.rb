require 'restaurant'

describe Restaurant do
  subject { Restaurant.new }

  it 'initializes dishes' do
    dishes = { burgers: 3.0, falafel: 4.5, burrito: 6.5, lasagna: 7.0, quiches: 5.5 }
    expect(described_class).to receive(:new).and_return(dishes)
    Restaurant.new
  end

  describe "#print_menu" do
    it 'shows a list of dishes' do
      expect(subject).to respond_to(:print_menu)
      subject.print_menu
    end
  end
end
