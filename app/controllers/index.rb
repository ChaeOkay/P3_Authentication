get '/' do
  # render home page
  # TODO: Show all users if user is signed in

  erb :index

end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  erb :sign_in
end

post '/sessions' do
    @user = User.find_by_email(params[:email])

    if @user.password == params[:password]
      session[:logged_in] = @user
      redirect '/'
    else
      redirect '/sessions/new'
    end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  sessions.clear
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end


post '/users' do

  new_user = User.create( :name => params[:name],
                    :email => params["user[email]"])

  new_user.password = params["user[password]"]
  puts new_user.password

  erb :sign_in
  # sign-up a new user
end
