class UserCardChargeSettingsController < ApplicationController
  before_action :set_user_card_charge_setting, only: [:show, :edit, :update, :destroy]

  # GET /user_card_charge_settings
  # GET /user_card_charge_settings.json
  def index
    @user_card_charge_settings = UserCardChargeSetting.paginate(page: params[:page], per_page: 10).order(updated_at: :desc)
  end

  # GET /user_card_charge_settings/1
  # GET /user_card_charge_settings/1.json
  def show
  end

  # GET /user_card_charge_settings/new
  def new
    @user_card_charge_setting = UserCardChargeSetting.new
  end

  # GET /user_card_charge_settings/1/edit
  def edit
  end

  # POST /user_card_charge_settings
  # POST /user_card_charge_settings.json
  def create
    @user_card_charge_setting = UserCardChargeSetting.new(user_card_charge_setting_params)

    respond_to do |format|
      if @user_card_charge_setting.save
        format.html { redirect_to user_card_charge_settings_url, notice: 'User card charge setting was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /user_card_charge_settings/1
  # PATCH/PUT /user_card_charge_settings/1.json
  def update
    respond_to do |format|
      if @user_card_charge_setting.update(user_card_charge_setting_params)
        format.html { redirect_to user_card_charge_settings_url, notice: 'User card charge setting was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /user_card_charge_settings/1
  # DELETE /user_card_charge_settings/1.json
  def destroy
    @user_card_charge_setting.destroy
    respond_to do |format|
      format.html { redirect_to user_card_charge_settings_url, notice: 'User card charge setting was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_card_charge_setting
      @user_card_charge_setting = UserCardChargeSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_card_charge_setting_params
      params.require(:user_card_charge_setting).permit(:min, :money_give)
    end
end