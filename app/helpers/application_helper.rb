module ApplicationHelper
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # def flash_class(level)
  #   case level
  #       when :notice then "alert alert-info"
  #       when :success then "alert alert-success"
  #       when :error then "alert alert-error"
  #       when :alert then "alert alert-error"
  #   end
  # end
  def flash_class(flash_type)
    { success: 'alert-success',
      error:   'alert-danger',
      alert:   'alert-warning',
      notice:  'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end


end
