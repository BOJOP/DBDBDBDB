module SessionsHelper
  
  # logs in the given personnel.
  def log_in(personnel)
    session[:personnel_id] = personnel.id
  end

  # remembers a personnel in persistent session.
  def remember(personnel)
    personnel.remember
    cookies.permanent.signed[:personnel_id] = personnel.id
    cookies.permanent[:remember_token] = personnel.remember_token
  end

  # returns true if the given personnel is the current personnel.
  def current_personnel?(personnel)
    personnel == current_personnel
  end

  # returns the current logged-in personnel (if nay)
  def current_personnel
    if (personnel_id = session[:personnel_id])
      @current_personnel ||= Personnel.find_by(id: session[:personnel_id])
    elsif (personnel_id = cookies.signed[:personnel_id])
      personnel = Personnel.find_by(id: personnel_id)
      if personnel && personnel.authenticated?(:remember, cookies[:remember_token])
        log_in personnel
        @current_personnel = personnel
      end
    end
  end

  # returns true if the personnel is logged in, false otherwise.
  def logged_in?
    !current_personnel.nil?
  end

  # forgets a persistent session.
  def forget(personnel)
    personnel.forget
    cookies.delete(:personnel_id)
    cookies.delete(:remember_token)
  end

  # logs out the current personnel.
  def log_out
    forget(current_personnel)
    session.delete(:personnel_id)
    @current_personnel = nil
  end

end
