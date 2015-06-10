require 'test_helper'

class BandTest < ActiveSupport::TestCase
  test "that a band requires a name" do
    band = FactoryGirl.build(:band, name: "")
    assert_not band.valid?
  end

  it "has a unique name" do
    Band.delete_all
    band_1 = FactoryGirl.create(:band, name:"Thrice")
    band_2 = FactoryGirl.build(:band, name:"Thrice")
    assert_not band_2.valid?
  end

  it "has a genre" do
    band = FactoryGirl.build(:band, genre: nil)
    assert_not band.valid?
  end

  it "has a city" do
    band = FactoryGirl.build(:band, city: nil)
    assert_not band.valid?
  end

  it "has a zipcode" do
    band = FactoryGirl.build(:band, zip: nil)
    assert_not band.valid?
  end

  it "has applied for a gig on dashboard" do
    band = FactoryGirl.build(:band, name:"Thrice")
    Gig.delete_all
    gig_1 = FactoryGirl.build(:gig, event:"Gig 1", age:"21+", price:"21", description:"test", date:"06/21/2015", showtime:"9:00pm", doors:"7:00pm", openings:"5", pay_amount:"500", paid_gig: nil)
    gig_2 = FactoryGirl.build(:gig, event:"", age:"", price:"", description:"", date:"", showtime:"", doors:"", openings:"", pay_amount:"", paid_gig: nil)
    assert_not gig_1.valid?
  end

  it "has booked a gig on dashboard" do
    band = FactoryGirl.build(:band, gig: "")
    assert_not band.valid?
  end
end
