require 'mqtt_op'

class FishController < ApplicationController
  before_action :set_fish, only: [:show, :edit, :update, :destroy]

  # Needs to be instantiated to a super class somewhere so multiple other controllers can use the same client
  $mqtt = MqttOp.new

  # GET /fish
  # GET /fish.json
  def index
    @fish = Fish.all
  end

  # GET /fish/1
  # GET /fish/1.json
  def show
  end

  def feed_fish
    $mqtt.feed_fish
    @fish = Fish.find(params[:fish_id])
    @fish.add_food
    if @fish.save
      render :status => "200", json: @fish
    end
  end

  # GET /fish/new
  def new
    @fish = Fish.new
  end

  # GET /fish/1/edit
  def edit
  end

  # POST /fish
  # POST /fish.json
  def create
    @fish = Fish.new(fish_params)

    respond_to do |format|
      if @fish.save
        format.html { redirect_to @fish, notice: 'Fish was successfully created.' }
        format.json { render :show, status: :created, location: @fish }
      else
        format.html { render :new }
        format.json { render json: @fish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fish/1
  # PATCH/PUT /fish/1.json
  def update
    respond_to do |format|
      if @fish.update(fish_params)
        format.html { redirect_to @fish, notice: 'Fish was successfully updated.' }
        format.json { render :show, status: :ok, location: @fish }
      else
        format.html { render :edit }
        format.json { render json: @fish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fish/1
  # DELETE /fish/1.json
  def destroy
    @fish.destroy
    respond_to do |format|
      format.html { redirect_to fish_index_url, notice: 'Fish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fish
      @fish = Fish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fish_params
      params.require(:fish).permit(:name, :food)
    end
end
