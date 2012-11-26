module ApplicationHelper

  # Retorna el título completo de la página
  def titulo_completo(titulo)
    titulo_base = "Aplicación de prueba"
    if titulo.nil?
      titulo_base
    else
      "#{titulo_base} | #{titulo}"
    end
  end
end
