require 'rspec'
require 'word_definition_creator'
require 'pry'

describe(Word) do
  before() do
    Word.clear()
  end

  describe("#initialize") do
    it('take word and definition and save as instance variable') do
      entry = Word.new('Puppy', 'An infant dog.')
      expect(entry.word).to(eq('Puppy'))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the word to the list of words") do
      entry = Word.new("Puppy", 'An infant dog')
      entry.save()
      expect(Word.all()).to(eq([entry]))
    end
  end

end
