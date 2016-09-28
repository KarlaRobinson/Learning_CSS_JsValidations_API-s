# new survey
get '/new/survey' do
  erb :create
end

post '/new/survey' do
  # survey = Survey.new(name: params[:name])
  # current_user.surveys << survey

  # question1 = Question.create(text: params[:question1])
  # question2 = Question.create(text: params[:question2])
  # question3 = Question.create(text: params[:question3])
  # survey.questions << question1
  # survey.questions << question2
  # survey.questions << question3

  # option1a = Option.create(text: params[:option_1a])
  # option1b = Option.create(text: params[:option_1b])
  # option1c = Option.create(text: params[:option_1c])
  # option2a = Option.create(text: params[:option_2a])
  # option2b = Option.create(text: params[:option_2b])
  # option2c = Option.create(text: params[:option_2c])
  # option3a = Option.create(text: params[:option_3a])
  # option3b = Option.create(text: params[:option_3b])
  # option3c = Option.create(text: params[:option_3c])

  # question1.options << option1a
  # question1.options << option1b
  # question1.options << option1c
  # question2.options << option2a
  # question2.options << option2b
  # question2.options << option2c
  # question3.options << option3a
  # question3.options << option3b
  # question3.options << option3c

  survey = Survey.find(1)

  redirect to ("/survey/#{survey.id}")
end

# see specific survey
get '/survey/:id' do
  @survey = Survey.find(params[:id])
  erb :respond
end

# # update survey
# post '/survey/:id' do

#   redirect to ('/survey')
# end

# respond survey
post '/survey/:id' do

  redirect ("users/#{current_user.id}?")
end



