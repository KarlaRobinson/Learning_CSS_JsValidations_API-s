get '/' do
  erb :index
end

get '/play' do
  @game = Game.create
  p "player1 #{params[:nombre1]} and player2 #{params[:nombre2]}"
  p1 = Player.create(name: params[:nombre1])
  p2 = Player.create(name: params[:nombre2])
  p "p1 #{p1} and p2 #{p2}"
  @game.players << p1
  @game.players << p2

  # if p1.valid? && p2.valid?
  #   game << @p1
  #   game << @p2
  # end
  # game.save
  erb :play
end

post '/stats' do
  game = params[:game]
  p "game inside stats #{game}"
  # if params[:data] == "0"
  #   game.winner = "Empate."
  # elsif params[:data] == "1"
  #   game.winner = "Ganador: Jugador1!"
  # elsif params[:data] == "2"
  #   game.winner = "Ganador: Jugador2!"
  # end
  # game.save
  # p "game inside stats #{game}"
  erb :stats
end
