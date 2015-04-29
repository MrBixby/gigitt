require 'test_helper'

class GigTest < ActiveSupport::TestCase
  test "that a gig requires description" do
    gig = Gig.new
    assert !gig.save
    assert !gig.errors[:description].empty?
  end

  test "that a gig's description is at least 2 letters" do
    gig = Gig.new
    gig.description = "H"
    assert !gig.save
    assert !gig.errors[:description].empty?
  end

  test "that a gig has a user id" do
    gig = Gig.new
    gig.description = "Hello"
    assert !gig.save
    assert !gig.errors[:user_id].empty?
  end
end
