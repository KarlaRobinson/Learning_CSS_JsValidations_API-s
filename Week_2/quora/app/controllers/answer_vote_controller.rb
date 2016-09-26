# create vote
post '/vote/question' do
  question = Question.find(params[:id])
  vote = Vote.create
  current_user.votes << vote
  question.votes << vote
  question.votes.length.to_s
end

post '/vote/answer' do
  p "*"*50
  p params[:id]
  answer = Answer.find(params[:id])
  vote = Vote.create
  current_user.votes << vote
  answer.votes << vote
  answer.votes.length.to_s
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

