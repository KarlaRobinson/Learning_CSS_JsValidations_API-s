user1 = User.create(name:"Karla", email: "Karla@gmail.com", password: "1111")
user2 = User.create(name: "Vanessa", email: "Vane@gmail.com", password: "2222")
user3 = User.create(name:"Tania", email: "Tania@gmail.com", password: "3333")
user4 = User.create(name:"Collin", email: "Collin@gmail.com", password: "4444")

survey1 = Survey.create(name: "BestMovies")
user1.surveys << survey1

question1 = Question.create(text: "Best girl teen classic?")
question2 = Question.create(text: "Best tear jerker?")
question3 = Question.create(text: "Best comedy?")
survey1.questions << question1
survey1.questions << question2
survey1.questions << question3

option1a = Option.create(text: "Parent Trap")
option1b = Option.create(text: "She's the Man")
option1c = Option.create(text: "Ever After")
option2a = Option.create(text: "7 Pounds")
option2b = Option.create(text: "My Sister's Keeper")
option2c = Option.create(text: "I am Sam")
option3a = Option.create(text: "Dirty Grandpa")
option3b = Option.create(text: "Forgetting Sara Marshall")
option3c = Option.create(text: "Our Idiot Brother")

question1.options << option1a
question1.options << option1b
question1.options << option1c
question2.options << option2a
question2.options << option2b
question2.options << option2c
question3.options << option3a
question3.options << option3b
question3.options << option3c

response1 = Response.create
response2 = Response.create
response3 = Response.create

user2.responses << response1
user2.responses << response2
user2.responses << response3

option1a.responses << response1
option2a.responses << response2
option3c.responses << response3

survey1.responses << response1
survey1.responses << response2
survey1.responses << response3

question1.responses << response1
question2.responses << response2
question3.responses << response3



