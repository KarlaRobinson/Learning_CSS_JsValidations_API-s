get '/' do
  erb :index
end

get '/play' do
  @game = Game.create
  
  if Player.find_by(name: params[:nombre1]) == nil
    p1 = Player.create(name: params[:nombre1])
  else 
    p1 = Player.find_by(name: params[:nombre1])
  end

  if Player.find_by(name: params[:nombre2]) == nil
    p2 = Player.create(name: params[:nombre2])
  else 
    p2 = Player.find_by(name: params[:nombre2])
  end

  @game.players << p1
  @game.players << p2

  erb :play
end

post '/stats' do
  game = Game.find(params[:game_id].to_i)
  p "game_id inside stats #{params[:game_id]}"
  p "game inside stats #{game}"
  p "data inside stats #{params[:data]}"
  if params[:data] == "0"
    puts "*" * 50
    puts "empate"
    game.winner = "Hubo un empate.."
  elsif params[:data] == "1"
    puts "*" * 50
    puts "jugador 1"
    game.winner = "Ganador: Jugador1!!!"
  elsif params[:data] == "2"
    puts "*" * 50
    puts "jugador 2"
    game.winner = "Ganador: Jugador2!!!"
  end
  game.save
  p "game inside stats #{game}"
  redirect to ("/stats/#{game.id}")
end

get '/stats/:game_id' do
  @game = Game.find(params[:game_id])
  erb :stats
end
