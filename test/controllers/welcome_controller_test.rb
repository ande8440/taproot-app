require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lat)
    assert_not_nil assigns(:lng)
    assert_not_nil assigns(:has_session_location)
    assert_select '#get_location_button'
    assert_select '#city_result', /Default.+/
  end
  
  test "should update current location" do
     post(:update_user_session_location, {'current_position_array' => [40.7127, -74.0059]})
     assert ! session[:current_position_array].blank?

     get :index
     assert_select '#delete_location_button'
     assert_select '#get_location_button', 0

  end
  
  test "should delete current location" do
    get :delete_user_session_location
    assert session[:current_position_array].blank?
    assert_redirected_to root_path

  end

end
