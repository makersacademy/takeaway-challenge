# frozen_string_literal: true

require './lib/menu'

describe Menu do
  include_examples 'Test Helpers'

  subject { described_class.new([menu_item, menu_item]) }

  it 'should be able to convert its menu items to a string' do
    expected = "Cafe Latte - 4.30\n"\
               "Cafe Latte - 4.30"
    expect(subject.menu_items_string).to eq expected
  end

  it 'should be able return an immutable items of its menu items' do
    original_items = subject.menu_items.dup
    subject.menu_items << ''
    expect(subject.menu_items).to eq original_items
  end

  context 'when retrieving menu items at specific indicies' do
    it 'should retrieve only the requested items' do
      expect(Menu.new(%w[1 2 3]).items_at([0, 2])).to eq %w[1 3]
    end

    it 'should fail silently if the index is out of range' do
      expect { subject.items_at([300]) }.not_to raise_error
    end
  end
end