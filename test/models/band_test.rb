require 'test_helper'

class BandTest < ActiveSupport::TestCase
  test "that a band requires a name" do
    band = FactoryGirl.build(:band, name: "")
    assert_not band.valid?
  end

  it 'has a unique name' do
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

end
