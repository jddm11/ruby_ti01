require 'test_helper'

class TallerControllerTest < ActionController::TestCase
  test "should get validarFirma" do
    get :validarFirma
    assert_response :success
  end

end
