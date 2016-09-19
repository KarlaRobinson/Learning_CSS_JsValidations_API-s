get '/' do
  erb :index
end

get '/:user_word' do
  @user_word = params[:user_word]
   @anagrams = Word.get_anagrams(@user_word)
  erb :word
end

post '/new_word' do
  redirect to ("/#{params[:user_word]}")
end