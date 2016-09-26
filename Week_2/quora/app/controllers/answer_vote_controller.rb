# create vote
post '/vote/question/:id' do
  question = Question.find(params[:id])
  vote = Vote.create
  current_user.votes << vote
  question.votes << vote
  redirect to ("/question/#{question.id}")
end

post '/vote/answer/:id' do
  answer = Answer.find(params[:id])
  vote = Vote.create
  current_user.votes << vote
  answer.votes << vote
  redirect to ("/question/#{answer.question_id}")
end

# create new answer
post '/answer' do
  answer = Answer.create(text: params[:text])
  question = Question.find(params[:question_id]).answers
  question << answer
  current_user.answers << answer
  redirect to ("/question/#{answer.question_id}")
end

#list users answerss
get '/answers/user/:id' do
  @questions = Question.all
  erb :users_answers
end

