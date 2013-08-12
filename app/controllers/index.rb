get '/' do
  @users = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
    @user = User.find_by_email(params[:email])

    # line 17 does not work for newly created users.
    # user object is located, but no method error is prompted:
    #      undefined method `password' for nil:NilClass

    # when querying with a seeded user, no error
    if @user.password == params[:password]
      session[:logged_in] = @user.id
      redirect '/'
    else
      redirect '/sessions/new'
    end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  session.clear
  redirect '/sessions/new'
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end


post '/users' do
  new_user = User.create( :name => params[:name],
                    :email => params["user[email]"])
  new_user.password = params["user[password]"]
  new_user.save

  check_user = User.find_by_name(params[:name])
  puts check_user

  erb :sign_in
end
