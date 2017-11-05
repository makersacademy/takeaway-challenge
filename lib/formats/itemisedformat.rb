require './lib/formats/formatter'

# ItemisedFormat is a formatting class. It is usually
# passed to Order #format to get pretty printed orders.
class ItemisedFormat
  DEFAULT_LENGTH = 20
  DEFAULT_COUNT_LENGTH = 3
  
  def initialize(length: DEFAULT_LENGTH, count_length: DEFAULT_COUNT_LENGTH)
    @item = @count = nil
    @length = length
    @count_length = count_length
  end

  def format(item, count)
    @item = item
    @count = count
    filled_content(1, ' ').join(' ')
  end

  private

  include Formatter

  def count_to_s
    "x#{@count}".ljust(@count_length)
  end

  def content
    [@item.title, count_to_s]
  end
end
