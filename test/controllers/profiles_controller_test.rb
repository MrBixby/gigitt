require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:justin).profile
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 on profile not found" do
    get :show, id: "doesn't exist"
    assert_response :not_found
  end

  test "that variables are assigned on successful profile viewing" do
    get :show, id: users(:justin).profile
    assert assigns(:user)
    assert_not_empty assigns(:gigs)
  end

  test "only show the correct user's gigs" do
    get :show, id: users(:justin).profile
    assigns(:gigs).each do |gig|
      assert_equal users(:justin), gig.user
  end
end
end
