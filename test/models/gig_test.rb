require 'test_helper'

class GigTest < ActiveSupport::TestCase
  test "that a gig requires description" do
    gig = FactoryGirl.build(:gig, description: "")
    assert_not gig.valid?
  end

  test "that a gig's description is at least 2 letters" do
    gig = FactoryGirl.build(:gig, description: "h")
    assert_not gig.valid?
  end

  it "requires an event name" do
    gig = FactoryGirl.build(:gig, event: "")
    assert_not gig.valid?
  end

  it "has an event name that meets length requirement" do
    gig = FactoryGirl.build(:gig, event: "111111111111111111111")
    assert_not gig.valid?
  end

  it "requires an age" do
    gig = FactoryGirl.build(:gig, age: "")
    assert_not gig.valid?
  end

  it "requires a price" do
    gig = FactoryGirl.build(:gig, price: "")
    assert_not gig.valid?
  end

  it "requires a date" do
    gig = FactoryGirl.build(:gig, date: nil)
    assert_not gig.valid?
  end

  it "requires a showtime" do
    gig = FactoryGirl.build(:gig, showtime: nil)
    assert_not gig.valid?
  end

  it "requires a doors open time" do
    gig = FactoryGirl.build(:gig, doors: nil)
    assert_not gig.valid?
  end

  describe "scopes" do
    before do
      Gig.delete_all
      @oldgig = FactoryGirl.create(:gig, date: 1.day.ago)
      @currentgig = FactoryGirl.create(:gig, date: Time.zone.today)
      @futuregig = FactoryGirl.create(:gig, date: 2.weeks.from_now)
      @finalgig = FactoryGirl.create(:gig, is_final: true)
      @pendinggig = FactoryGirl.create(:gig)
      @superoldgig = FactoryGirl.create(:gig, date: 1.year.ago)
    end

    it "returns gigs that are greater or equal to todays date" do
      gigs = Gig.upcoming
      assert_includes gigs, @futuregig
      refute_includes gigs, @oldgig
    end

    it "returns gigs that are not finalized" do
      gigs = Gig.pending
      assert_includes gigs, @pendinggig
      refute_includes gigs, @finalgig
    end

    it "returns gigs that are finalized" do
      gigs = Gig.finalized
      assert_includes gigs, @finalgig
      refute_includes gigs, @pendinggig
    end

    it "returns gigs whose date has passed" do
      gigs = Gig.past
      assert_includes gigs, @superoldgig
      assert_includes gigs, @oldgig
      refute_includes gigs, @currentgig
    end

    it "returns gigs that are between today and a week from now" do
      gigs = Gig.present
      assert_includes gigs, @currentgig
      refute_includes gigs, @futuregig
      refute_includes gigs, @oldgig
    end

    it "returns gigs whose dates are greater than or equal to a week from now" do
      gigs = Gig.future
      assert_includes gigs, @futuregig
      refute_includes gigs, @currentgig
      refute_includes gigs, @oldgig
    end

    it "returns an array of hired bands" do
        bandlist = FactoryGirl.create(:bandlist_with_hired_band)
        gig = bandlist.gig
        bands = gig.hired_bandlists
        assert_includes bands, bandlist
    end
  end

  describe "band related methods" do
    before do
      Gig.delete_all
      @gig = FactoryGirl.create(:gig)
      @band = FactoryGirl.create(:band)
      @gig2 = FactoryGirl.create(:gig)
      @gig2.bands << @band
    end

    describe "#band_options" do
      it "returns no bands available if there are no associated bands" do
        gig = @gig.band_options
        assert_includes gig, "No Bands Available"
      end

      it "returns an array of available band names and id's" do
        gig = @gig2.band_options
        assert_includes gig, [@band.name, @band.id]
      end
    end
  end
end
