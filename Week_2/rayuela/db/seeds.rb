Game.create.players << Player.create(name: "Vanessa")
Game.find(1).players << Player.create(name: "Karla")

Game.create.players << Player.create(name: "Laura")
Game.find(2).players << Player.find(2)
Game.find(2).players << Player.find(1)