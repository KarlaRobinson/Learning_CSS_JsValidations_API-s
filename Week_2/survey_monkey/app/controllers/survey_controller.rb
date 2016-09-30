# new survey
get '/new/survey' do
  erb :create
end

post '/new/survey' do
  # p params
  # p params[:q1]
  # # p params.length == 4
  # # p params[:q1].length == 4
  # # p params[:q2].length == 4
  # # p params[:q3].length == 4
  survey = Survey.new(name: params[:name])
  current_user.surveys << survey

  question1 = Question.create(text: params[:q1][0])
  question2 = Question.create(text: params[:q2][0])
  question3 = Question.create(text: params[:q3][0])
  survey.questions << question1
  survey.questions << question2
  survey.questions << question3

  option1a = Option.create(text: params[:q1][1])
  option1b = Option.create(text: params[:q1][2])
  option1c = Option.create(text: params[:q1][3])
  option2a = Option.create(text: params[:q2][1])
  option2b = Option.create(text: params[:q2][2])
  option2c = Option.create(text: params[:q2][3])
  option3a = Option.create(text: params[:q3][1])
  option3b = Option.create(text: params[:q3][2])
  option3c = Option.create(text: params[:q3][3])

  question1.options << option1a
  question1.options << option1b
  question1.options << option1c
  question2.options << option2a
  question2.options << option2b
  question2.options << option2c
  question3.options << option3a
  question3.options << option3b
  question3.options << option3c

  # survey = Survey.find(1)

  survey.id.to_s
end

# respond to specific survey
get '/answer/survey/:id' do
  @survey = Survey.find(params[:id])
  erb :respond
end

post '/answer/survey/:id' do
  survey = Survey.find(params[:id])

  response1 = Response.create
  response2 = Response.create
  response3 = Response.create

  current_user.responses << response1
  current_user.responses << response2
  current_user.responses << response3

  survey.questions[0].responses << response1
  survey.questions[1].responses << response2
  survey.questions[2].responses << response3

  survey.responses << response1
  survey.responses << response2
  survey.responses << response3

  ans1 = (params[:option0].to_i) - 1
  ans2 = (params[:option1].to_i) - 1
  ans3 = (params[:option2].to_i) - 1

  survey.questions[0].options[ans1].responses << response1
  survey.questions[1].options[ans2].responses << response2
  survey.questions[2].options[ans3].responses << response3

  redirect ("users/#{current_user.id}?")
end

# # see a specific survey
# get '/survey/:id' do
#   @survey = Survey.find(params[:id])
#   erb :survey
# end


# stats survey
get '/stats/survey/:id' do
  @survey = Survey.find(params[:id])
  erb :survey_stats
end




