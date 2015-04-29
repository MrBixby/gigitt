class ProfilesController < ApplicationController
  def show
    @user = User.find_by_profile(params[:id])
    if @user
      @gigs = @user.gigs.all
      render action: :show
    else
      render file: 'public/404', status: 404, formats: [:html]
    end
  end
end
