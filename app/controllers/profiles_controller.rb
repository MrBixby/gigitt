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

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save

        # Sends email to user when user is created.
        GigittMailer.gigitt_email(@user).deliver

        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
