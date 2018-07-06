class Word
  @@dictionary = []
  attr_reader(:id)
  attr_accessor(:word, :definition)

  def initialize(word, definition)
    @word = word
    @id = (@@dictionary.length + 1).to_i
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

  def self.find(id)
  @@dictionary[id - 1]
  end

end
