require 'sinatra'
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require 'pry'

get('/') do
  @dictionary = Word.all()
  erb(:dictionary)
end

get('/sort') do
  Word.sort()
  @dictionary = Word.all()
  erb(:dictionary)
end

post('/') do
  word = params['word']
  definition = params['definition']
  entry = Word.new(word, definition)
  entry.image = params['image']
  entry.save()
  @dictionary = Word.all()
  erb(:dictionary)
end

get('/entry/:id') do
  @entry = Word.find((params[:id]).to_i)
  erb(:entry)
end

post('/entry/:id') do
  definition=params['new-definition']
  @entry = Word.find((params[:id]).to_i)
  @entry.definition.push(definition)
  erb(:entry)
end

get('/full') do
  @dictionary = Word.all()
  erb(:full)
end
