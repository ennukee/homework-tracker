module ApplicationHelper
	def sortable(column, title = nil)
  		title ||= column.titleize
  		css_class = column == sort_column ? "current #{sort_direction}" : nil
  		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  		link_to title, {:sort => column, :direction => direction}, {:class => css_class}
	end

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
  end
end
