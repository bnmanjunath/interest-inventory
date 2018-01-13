class InterestsController < ApplicationController
  before_action :set_interest, only: [:show, :edit, :update, :destroy]

  # GET /interests
  # GET /interests.json
  def index
    @interests = Interest.all
  end

  # GET /interests/1
  # GET /interests/1.json
  def show
  end

  def update_all_answers
    #@asda = Interest.all
    @interests.update(interest_params)
    

    # @interests.each do |interest|
    #   interest.update!(answer: 1)
    # end
    Rails.logger.debug("#{@interests.inspect}")
    # (0..81).each do |n|
    #  new_answer = @answers[n]
    #  question = Interest.find(n+1)
    #  question.update!(answer: new_answer)
    # end
    redirect_to interests_url
  end

  # GET /interests/new
  def new
    @interest = Interest.new
  end

  # GET /interests/1/edit
  def edit
    respond_to do |format|
      if @interest.update(interest_params)
        format.html { redirect_to @interest, notice: 'Your answers were submitted.' }
        format.json { render :show, status: :ok, location: @interest }
      else
        format.html { render :edit }
        format.json { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /interests
  # POST /interests.json
  def create
    @interest = Interest.new(interest_params)

    respond_to do |format|
      if @interest.save
        format.html { redirect_to @interest, notice: 'Your answers were submitted.' }
        format.json { render :show, status: :created, location: @interest }
      else
        format.html { render :new }
        format.json { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interests/1
  # PATCH/PUT /interests/1.json
  def update
    respond_to do |format|
      if @interest.update(interest_params)
        format.html { redirect_to @interest, notice: 'Your answers were submitted.' }
        format.json { render :show, status: :ok, location: @interest }
      else
        format.html { render :edit }
        format.json { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interests/1
  # DELETE /interests/1.json
#  def destroy
#    @interest.destroy
#    respond_to do |format|
#      format.html { redirect_to interests_url, notice: 'Interest was successfully destroyed.' }
#      format.json { head :no_content }
#    end
#  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interest
      logger.error("#{params[:id]}")
      @interest = Interest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interest_params
      params.permit(:question, :answer)
    end
end
