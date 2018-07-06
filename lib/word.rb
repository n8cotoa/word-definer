class Word
  @@dictionary = []
  attr_reader(:id, :dictionary)
  attr_accessor(:word, :definition)

  def initialize(word, definition)
    @word = word
    @id = (@@dictionary.length + 1).to_i
    @definition = []
    @definition.push(definition)
  end

  def self.all()
    @@dictionary
  end

  def self.sort()
    @@dictionary = @@dictionary.sort_by{ |entry| entry.word }
  end

  def save
    @@dictionary.push(self)
  end

  def self.clear()
    @@dictionary = []
  end

  def self.find(id)
  @@dictionary[id - 1]
  end

  def self.find_random()
    num = @@dictionary.length
    random = rand(num) + 1
    binding.pry
    random
  end
end
