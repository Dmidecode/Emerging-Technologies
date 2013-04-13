module ApplicationHelper

  def logo
    image_tag("Street_Fighter_IV_Logo.png", :alt => "Street Fighter 4", :class => "round")
  end

  def title
    base_title = "MyLittleWiki"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
