helpers do

  def current_user
    session[:logged_in] ||= false
  end

end
