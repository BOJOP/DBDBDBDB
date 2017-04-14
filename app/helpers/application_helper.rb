module ApplicationHelper

  def full_title(page_title = '')
    base_title = "DB project"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  # redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarind_url)
  end
  
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
