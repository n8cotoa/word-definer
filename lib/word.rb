class Word
  @@dictionary = []
  attr_reader(:id, :dictionary)
  attr_accessor(:word, :definition, :image)

  def initialize(word, definition)
    @word = word
    @id = (@@dictionary.length + 1).to_i
    @definition = []
    @definition.push(definition)
    @image = ""
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
end
