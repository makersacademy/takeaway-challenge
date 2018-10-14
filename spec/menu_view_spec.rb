require 'menu_view'

describe MenuView do

  describe 'display' do
    let(:category) { double :category, name: 'main', items: "items" }
    let(:categories) { [category] }
    let(:category_view) { double :category_view, display: 'category' }
    let(:category_view_class) { double :category_view_class, new: category_view }
    let(:menu) { double :menu, categories: categories }
    subject { described_class.new(menu, category_view_class) }

    it "displays the categories' views' in the menu" do
      expect(category_view_class).to receive(:new).with(category).and_return(category_view)
      subject.display
    end

    it "displays the categories' views' in the menu" do
      allow(category_view_class).to receive(:new).with(category).and_return(category_view)
      expect(category_view).to receive(:display)
      subject.display
    end
  
  end
end
