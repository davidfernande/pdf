module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end
  
  def display_entero_es(valor)
    number_with_delimiter(number_with_precision(valor, precision: 0), delimiter: ".", separator: ",")
  end
  def display_es(valor)
    number_with_delimiter(valor, delimiter: ".", separator: ",")
  end
end
