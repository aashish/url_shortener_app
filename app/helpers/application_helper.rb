# application helper
module ApplicationHelper
  def custom_url
    if Rails.env == 'production'
      request.host
    else
      "#{request.host}: #{request.port}"
    end
  end
end
