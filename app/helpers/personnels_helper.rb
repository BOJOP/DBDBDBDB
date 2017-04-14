module PersonnelsHelper
  
  # Returns the Gravatar for the given personnel.
  def gravatar_for(personnel, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(personnel.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: personnel.id, class: "gravatar")
  end
end
