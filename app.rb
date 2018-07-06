require 'sinatra'
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')

get('/') do
  @dictionary = Word.all()
  erb(:dictionary)
end

post('/') do
  word = params['word']
  definition = params['definition']
  entry = Word.new(word, definition)
  entry.save()
  @dictionary = Word.all()
  erb(:dictionary)
end

get('/entry/:id') do
  @entry = Word.find((params[:id]).to_i)
  erb(:entry)
end

post('/entry/:id') do
  definition=params['definition']
  @entry = Word.find((params[:id]).to_i)
  @entry.definition.push(definition)
  erb(:entry)
end
