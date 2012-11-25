require 'test_helper'

class PaginasEstaticasControllerTest < ActionController::TestCase
  test "should get inicio" do
    get :inicio
    assert_response :success
  end

  test "should get acerca_de" do
    get :acerca_de
    assert_response :success
  end

  test "should get contacto" do
    get :contacto
    assert_response :success
  end

  test "should get politica_de_privacidad" do
    get :politica_de_privacidad
    assert_response :success
  end

  test "should get preguntas_frecuentes" do
    get :preguntas_frecuentes
    assert_response :success
  end

end
