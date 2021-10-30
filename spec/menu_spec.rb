require 'menu'

describe Menu do
  describe '#initialize' do
    it 'has a list of dishes upon initialization' do
      expect(subject.dishes).to_not eq nil
    end
  end

  describe '#select' do
    # it 'has a list of selected dishes' do
    #   expect { subject.select(dish) }.to change { subject.selected_dishes.count }.by(1)
    # end
  end
end