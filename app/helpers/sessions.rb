helpers do

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      session[:user_id] = @user.id
    else
      redirect '/'
    end
  end

  def current_user
    @user = User.find(session[:user_id])
  end

end
