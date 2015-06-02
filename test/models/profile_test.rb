require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  test "that a user has a first name" do
    profile = FactoryGirl.build(:profile, first_name: "")
    assert_not profile.valid?
  end

  test "that a user has a last name" do
    profile = FactoryGirl.build(:profile, last_name: "")
    assert_not profile.valid?
  end

  it "builds a full name" do
    profile = FactoryGirl.create(:profile)
    assert_equal profile.full_name, "#{profile.first_name} #{profile.last_name}"
  end
end
