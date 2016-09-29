# new survey
get '/new/survey' do
  erb :create
end

post '/new/survey' do
  p params
  p params.length == 4
  p params[:q1].length == 4
  p params[:q2].length == 4
  p params[:q3].length == 4
  # survey = Survey.new(name: params[:name])
  # current_user.surveys << survey

  # question1 = Question.create(text: params[:q1][0])
  # question2 = Question.create(text: params[:q2][0])
  # question3 = Question.create(text: params[:q3][0])
  # survey.questions << question1
  # survey.questions << question2
  # survey.questions << question3

  # option1a = Option.create(text: params[:q1][1])
  # option1b = Option.create(text: params[:q1][2])
  # option1c = Option.create(text: params[:q1][3])
  # option2a = Option.create(text: params[:q2][1])
  # option2b = Option.create(text: params[:q2][2])
  # option2c = Option.create(text: params[:q2][3])
  # option3a = Option.create(text: params[:q3][1])
  # option3b = Option.create(text: params[:q3][2])
  # option3c = Option.create(text: params[:q3][3])

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
  # redirect to ("/survey/#{survey.id}")
  survey.id.to_s
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



