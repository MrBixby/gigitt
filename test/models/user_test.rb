require 'test_helper'

class UserTest < ActiveSupport::TestCase
  it 'creates a user' do
    user_justin = FactoryGirl.build(:user)
    user_justin.must_be_instance_of User
  end

  it 'does not allow special characters in username' do
    user_1 = FactoryGirl.build(:user, username:"u$er")
    assert_not user_1.valid?
  end

  it 'has a username' do
    user_1 = FactoryGirl.build(:user, username:"")
    assert_not user_1.valid?
  end

  it 'has a unique username' do
    User.delete_all
    user_1 = FactoryGirl.create(:user, username:"user1")
    user_2 = FactoryGirl.build(:user, username:"user1")
    assert_not user_2.valid?
  end

end
