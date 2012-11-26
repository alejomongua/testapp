module ApplicationHelper

  # Retorna el título completo de la página
  def titulo_completo(titulo_pagina)
    titulo_base = "Aplicación de prueba"
    if titulo_pagina.blank?
      titulo_base
    else
      "#{titulo_base} | #{titulo_pagina}"
    end
  end
end
