# Formatter defines utility functions for other formatting classes.
module Formatter
  def content_length
    # add content.length to account for spacing
    content.map(&:length).reduce(0, :+) + content.length
  end

  def get_fill(char)
    ''.ljust(@length - content_length, char)
  end

  def filled_content(insert_at, fill_with)
    content.insert(insert_at, get_fill(fill_with))
  end
end
