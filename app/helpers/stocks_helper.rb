module StocksHelper
	def sort_link(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    icon = sort_direction == "asc" ? "glyphicon glyphicon-chevron-up" : "glyphicon glyphicon-chevron-down"
    icon = column == sort_column ? icon : ""
    link_to "#{title} <span class='#{icon}'></span>".html_safe, {column: column, direction: direction}
  end

  def getKemasan(obat_id)
  	kemasan = Obat.find(obat_id).kemasan_id
  	kemasan_name = Kemasan.find(kemasan).kemasan_unit
  	return kemasan_name
  end

  def getIsi(obat_id)
  	kemasan = Obat.find(obat_id).kemasan_id
  	kemasan_name = Kemasan.find(kemasan).kemasan_cap
  	return kemasan_name
  end
end
