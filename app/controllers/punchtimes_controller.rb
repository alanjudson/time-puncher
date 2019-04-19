class PunchtimesController < ApplicationController
  before_action :set_punchtime, only: [:show, :edit, :update, :destroy]
  before_action :require_signin
  # GET /punchtimes
  # GET /punchtimes.json
  def index
    @punchtimes = Punchtime.all
  end

  # GET /punchtimes/1
  # GET /punchtimes/1.json
  def show
  end

  # GET /punchtimes/new
  def new
    @punchtime = current_user.punchtimes.build
  end

  # GET /punchtimes/1/edit
  def edit
  end

  # POST /punchtimes
  # POST /punchtimes.json
  def create
    @punchtime = current_user.punchtimes.build(punchtime_params)
    respond_to do |format|
      if @punchtime.save
        format.html { redirect_to( current_user, notice: 'Punchtime was successfully created.') }
        format.json { render :show, status: :created, location: @punchtime }
      else
        format.html { render :new }
        format.json { render json: @punchtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /punchtimes/1
  # PATCH/PUT /punchtimes/1.json
  def update
    respond_to do |format|
      if @punchtime.update(punchtime_params)
        format.html { redirect_to current_user, notice: 'Punchtime was successfully updated.' }
        format.json { render :show, status: :ok, location: @punchtime }
      else
        format.html { render :edit }
        format.json { render json: @punchtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /punchtimes/1
  # DELETE /punchtimes/1.json
  def destroy
    @punchtime.destroy
    respond_to do |format|
      format.html { redirect_to punchtimes_url, notice: 'Punchtime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_punchtime
      @punchtime = Punchtime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def punchtime_params
      params.require(:punchtime).permit(:punch_type, :description, :time)
    end
end
