#!/usr/bin/env ruby

# Formatter defines utility functions for the
# formatting classes below.

module Formatter
  DEFAULT_LENGTH = 40

  private

  def content_length
    # add content.length to account for spacing
    content.map { |item| item.length }.reduce(0, :+) + content.length
  end

  def get_fill(char)
    ''.ljust(@default_length - content_length, char)
  end

  def filled_content(insert_at, fill_with)
    content.insert(insert_at, get_fill(fill_with))
  end
end

# MenuFormat is a formatting class. It is usually passed
# to Menu #format to get pretty printed menus.

class MenuFormat
  include Formatter

  DEFAULT_INDEX_LENGTH = 5

  def initialize(length: DEFAULT_LENGTH, index_length: DEFAULT_INDEX_LENGTH)
    @index = @item = nil
    @default_length = length
    @default_index_length = index_length
  end

  def format(index, item)
    @index = index
    @item = item
    filled_content(2, '.').join(' ')
  end

  private

  def index_to_s
    "#{@index} |".rjust(@default_index_length)
  end

  def content
    [index_to_s, @item.title, @item.price]
  end
end

# ItemisedFormat is a formatting class. It is usually
# passed to Order #format to get pretty printed orders.

class ItemisedFormat
  include Formatter

  DEFAULT_COUNT_LENGTH = 3

  def initialize(length: DEFAULT_LENGTH, count_length: DEFAULT_COUNT_LENGTH)
    @item = @count = nil
    @default_length = length
    @default_count_length = count_length
  end

  def format(item, count)
    @item = item
    @count = count
    filled_content(1, ' ').join(' ')
  end

  private

  def count_to_s
    "x#{@count}".ljust(@default_count_length)
  end

  def content
    [@item.title, count_to_s]
  end
end
