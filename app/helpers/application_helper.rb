module ApplicationHelper
  def safe_image_tag(user)
    if user.facebook_picture_url
      image_tag(user.facebook_picture_url, class: "avatar dropdown-toggle", id: "navbar-wagon-menu", "data-toggle" => "dropdown")
    elsif user.photo
      cl_image_tag(user.photo.path, class: "avatar dropdown-toggle", id: "navbar-wagon-menu", "data-toggle" => "dropdown")
    else
      image_tag("http://placehold.it/30x30", class: "avatar dropdown-toggle", id: "navbar-wagon-menu", "data-toggle" => "dropdown")
    end
  end
end
