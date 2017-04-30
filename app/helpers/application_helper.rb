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

  def controller?(*controller)
    if controller.include?(params[:controller])
      return 'active'
    else
      return ''
    end
  end

  def action?(*action)

    if action.include?(params[:action])
      return 'active'
    else
      return ''
    end
  end

  def controller_data?()
    controller = ["personnels", "departments", "courses", "groups", "rules", "time_slots"]

    if controller.include?(params[:controller])
      return 'active'
    else
      return ''
    end
  end

end
