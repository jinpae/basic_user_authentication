module ApplicationHelper
	def nav_link_to(text, url)
		if current_page? url
			link = link_to url do
				"#{text} <span class='sr-only'>(current)</span>".html_safe
			end
			css_class = "active"
		else
			link = link_to text, url
		end

		content_tag :li, link, class: css_class
	end
end
