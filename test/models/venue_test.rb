require 'test_helper'

class VenueTest < ActiveSupport::TestCase
  test "that a venue requires a name" do
    venue = FactoryGirl.build(:venue, name: "")
    assert_not venue.valid?
  end

  it "has a unique name" do
    Venue.delete_all
    venue_1 = FactoryGirl.create(:venue, name:"Chain")
    venue_2 = FactoryGirl.build(:venue, name:"Chain")
    assert_not venue_2.valid?
  end

  it "requires an address" do
    venue = FactoryGirl.build(:venue, address: "")
    assert_not venue.valid?
  end

  it "has a unique address" do
    Venue.delete_all
    venue_1 = FactoryGirl.create(:venue, address:"1234")
    venue_2 = FactoryGirl.build(:venue, address:"1234")
    assert_not venue_2.valid?
  end

  it "requires a city" do
    venue = FactoryGirl.build(:venue, city: "")
    assert_not venue.valid?
  end

  it "requires a state" do
    venue = FactoryGirl.build(:venue, state: "")
    assert_not venue.valid?
  end

  it "requires an zip" do
    venue = FactoryGirl.build(:venue, zip: "")
    assert_not venue.valid?
  end

  it "requires a phone" do
    venue = FactoryGirl.build(:venue, phone: "")
    assert_not venue.valid?
  end

  it "has a unique phone" do
    Venue.delete_all
    venue_1 = FactoryGirl.create(:venue, phone:"7144752316")
    venue_2 = FactoryGirl.build(:venue, phone:"7144752316")
    assert_not venue_2.valid?
  end

  it "requires a email" do
    venue = FactoryGirl.build(:venue, email: "")
    assert_not venue.valid?
  end

  it "has a unique email" do
    Venue.delete_all
    venue_1 = FactoryGirl.create(:venue, email:"chain@test.com")
    venue_2 = FactoryGirl.build(:venue, email:"chain@test.com")
    assert_not venue_2.valid?
  end
end
