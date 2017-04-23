class Menu

  attr_reader :list_of_dishes

  def initialize(array_of_hashes = [])
    @list_of_dishes = Hash.new
    merge_function(array_of_hashes)
  end

  def print_list
    string = ""
    list_of_dishes.each_with_index { |dish, index|
      string += "#{dish[0]} - £#{dish[1]}"
      string += "\n" if index < list_of_dishes.count-1
    }
    string
  end

  def add(hash)
    @list_of_dishes = @list_of_dishes.merge!(hash)
  end

  def remove(hash)
    raise "Menu does not contain that dish" unless list_of_dishes.include?(hash)
    @list_of_dishes.delete_if {|key, value| hash.keys.include?(key) && hash.values.include?(value) }
  end

  private

  def merge_function(array_of_hashes)
    array_of_hashes.each do |dish|
      @list_of_dishes.merge!(dish)
    end
  end

end

class Hash
  def include?(other)
    self.merge(other) == self
  end
end
