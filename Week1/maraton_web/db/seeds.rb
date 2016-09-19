
User.create(name: "Karla", email: "Karla@gmail.com", password: 333444)
User.create(name: "Paloma", email: "Paloma@gmail.com", password: 555666)
User.create(name: "Tania", email: "Tania@gmail.com", password: 777888)

card1 = Card.create(question: "India does not touch which country?", answer: "Oman", fake_ans1: "Bangladesh", fake_ans2: "Nepal")
card2 = Card.create(question: "The capital of Afganistan is?", answer: "Kabul", fake_ans1: "Tehran", fake_ans2: "Baghdad")
card3 = Card.create(question: "Lima is the capital of what country?", answer: "Peru", fake_ans1: "Bolivia", fake_ans2: "Chile")
card4 = Card.create(question: "The capital of Nigeria is", answer: "Abuja", fake_ans1: "Beirut", fake_ans2: "Rabat")
card5 = Card.create(question: "Beirut is the capital of what country?", answer: "Lebanon", fake_ans1: "Turkey", fake_ans2: "Morroco")

deck1 = Deck.create(name: "History")
deck1.cards << card1
deck1.cards << card2
deck1.cards << card3
deck1.cards << card4
deck1.cards << card5

