module ApplicationHelper
	def nav_link(link_text, link_path)
	  class_name = current_page?(link_path) ? 'active' : ''

	  content_tag(:li, :class => class_name) do
	    link_to link_text, link_path
	  end
	end

	def current_class?(test_path)
    return 'active' if request.path == test_path
    ''
  end
end