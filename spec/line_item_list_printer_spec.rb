# frozen_string_literal: true

require './lib/line_item_list_printer'

describe 'LineItemListPrinter' do
  include_examples 'Test Helpers'

  class TestPrinter
    include LineItemListPrinter

    def initialize(menu_items)
      @menu_items = menu_items
    end
  end

  subject { TestPrinter.new([menu_item, menu_item]) }

  it 'has a default conjoiner of new line' do
    expect(subject.menu_items_string).to eq "Cafe Latte - 4.30\n"\
                                            "Cafe Latte - 4.30"
  end

  it 'can accept a custom conjoiner' do
    expect(subject.menu_items_string('*')).to eq 'Cafe Latte - 4.30*'\
                                                 'Cafe Latte - 4.30'
  end
end