
#create new question
post '/question' do
  question = Question.create(text: params[:text])
  current_user.questions << question
  redirect to ("/question/#{question.id}")
end

#display a specific question
post '/question/search' do
  redirect to ("/question/#{params[:id]}")
end

get '/question/:id' do
  @question = Question.find(params[:id])
  erb :search_for_question
end

# list all questions
get '/questions/all' do
  @all = Question.all
  erb :list_questions
end

#list users questions
get '/questions/user/:id' do
  erb :users_questions
end