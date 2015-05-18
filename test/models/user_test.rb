require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile].empty?
  end

  test "a user should have a unique profile name" do
    user = User.new
    user.username = users(:justin).username

    assert !user.save
    assert !user.errors[:profile].empty?
  end

  test "a user should have a profile name without spaces" do
    user = User.new
    user.username = "My Profile with Spaces"

    assert !user.save
    assert !user.errors[:profile].empty?
    assert user.errors[:profile].include?("Must be formated correctly.")
  end
end
