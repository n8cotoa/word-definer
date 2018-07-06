class Word
  @@dictionary = []

  attr_reader(:word, :definition)

  def initialize(word, definition)
    @word = word
    @id = @@dictionary.length + 1
    @definition = definition
  end

  def self.all()
    @@dictionary
  end

  def save
    @@dictionary.push(self)
  end

  def self.clear()
    @@dictionary = []
  end

end
