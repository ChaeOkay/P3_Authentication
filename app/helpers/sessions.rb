helpers do

  def current_user
    User.find_by_id(session[:logged_in])  || false
  end

end
