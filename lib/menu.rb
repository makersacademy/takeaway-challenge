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

  private

  def merge_function(array_of_hashes)
    array_of_hashes.each do |dish|
      @list_of_dishes.merge!(dish)
    end
  end

end
