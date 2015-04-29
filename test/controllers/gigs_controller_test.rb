require 'test_helper'

class GigsControllerTest < ActionController::TestCase
  setup do
    @gig = gigs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gigs)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render the new page when logged in" do
    sign_in users(:justin)
    get :new
    assert_response :success
  end

  test "should be logged in to post a gig" do
    post :create, gig: { description: "Hello" }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create gig when logged in" do
    sign_in users(:justin)

    assert_difference('Gig.count') do
      post :create, gig: { description: @gig.description }
    end
  end

  test "should show gig" do
    get :show, id: @gig
    assert_response :success
  end

  test "should get edit when logged in" do
    sign_in users(:justin)
    get :edit, id: @gig
    assert_response :success
  end

  test "should redirect gig update when not logged in" do
    put :update, id: @gig, gig: { event: @gig.event, date: @gig.date, band: @gig.band, doors: @gig.doors, showtime: @gig.showtime, age: @gig.age, price: @gig.price, description: @gig.description }
    assert_response :redirect
    assert_redirected_to gig_path(assigns(:gig))
  end

  test "should update gig when logged in" do
    sign_in users(:justin)
    put :update, id: @gig, gig: { event: @gig.event, date: @gig.date, band: @gig.band, doors: @gig.doors, showtime: @gig.showtime, age: @gig.age, price: @gig.price, description: @gig.description }
    assert_redirected_to gig_path(assigns(:gig))
  end

  test "should get destroy when logged in" do
    sign_in users(:justin)
    assert_difference('Gig.count', -1) do
      delete :destroy, id: @gig
    end

    assert_redirected_to gigs_path
  end
end
