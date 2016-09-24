user1 = User.create(name:"Karla", email: "Karla@gmail.com", password: "1111")
user2 = User.create(name: "Vanessa", email: "Vane@gmail.com", password: "2222")
user3 = User.create(name:"Maryel", email: "Tania@gmail.com", password: "3333")
user4 = User.create(name:"Abraham", email: "Collin@gmail.com", password: "4444")

question1 = Question.create(text:"What is the best way to peel an egg?")
question2 = Question.create(text:"What bus takes me to Toreo?") 

answer1 = Answer.create(text:"Crack it into a kinder egg and boil it!")

vote1 = Vote.create
vote2 = Vote.create

user1.questions << question1
user2.questions << question2

user3.answers << answer1
question1.answers << answer1

user1.votes << vote1
answer1.votes << vote1

user2.votes << vote2
question1.votes << vote2




