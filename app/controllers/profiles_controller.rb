class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    respond_to do |format|
      format.html do
        @profile = Profile.new
        @profile.user = current_user
      end
      format.json do
        @profiles = Profile.all
        render json: @profiles
      end
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @user = @profile.user
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new
    @profile.name = params[:profile][:name]
    @profile.gender = params[:profile][:gender]
    @profile.rating = params[:profile][:rating]
    @profile.bio = params[:profile][:bio]
    @profile.user = current_user
    @profile.save
      render json: @profile
  end

  def edit
  end


  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit!
    end
    
end
