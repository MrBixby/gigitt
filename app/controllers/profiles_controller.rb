class ProfilesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)

    respond_to do |format|
      if @profile.save

        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :profile, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update(profile_params)

        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :profile, status: :updated, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :city, :state, :zip, :facebook, :twitter, :instagram )
  end
end
