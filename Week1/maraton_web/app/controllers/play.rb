# get '/deck/new' do
#   @deck = Deck.create(params[:name])
#   erb :play
#   #should ask for card answer and questions first and then create the deck
# end

# get '/deck:id' do
#   @deck = Deck.find_by(name: params[:name])
#   erb :play
# end

post '/guess/:deck_id' do
  puts "*" * 50
  puts "deck_id"
  p params[:deck_id]
  puts "guess"
  p params[:guess]
  erb :play
end