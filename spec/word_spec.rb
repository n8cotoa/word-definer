require 'rspec'
require 'word'
require 'pry'

describe('Word') do
  before() do
    Word.clear()
  end
  describe("#initialize") do
    it('take word and definition and save as instance variable') do
      entry = Word.new('Puppy', 'An infant dog')
      expect(entry.word).to(eq('Puppy'))
      expect(entry.definition).to(eq(['An infant dog']))
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
  describe(".find") do
    it("finds an entry based on its id") do
      entry = Word.new("tacos", 'yummy mexican food')
      entry.save()
      entry2 = Word.new("pizza", "my favorite lunch food")
      entry2.save()
      expect(Word.find(1)).to(eq(entry))
      expect(Word.find(2)).to(eq(entry2))
    end
  end
end
