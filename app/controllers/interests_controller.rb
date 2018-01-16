class InterestsController < ApplicationController
  before_action  :interest_params, only: [:new, :create, :show, :edit, :edit_all, :update_all_answers, :update, :destroy]

  # GET /interests
  # GET /interests.json
  def index
    @interest = Interest.all
    #@interests = Interest.find(1,10)
  end

  # GET /interests/1
  # GET /interests/1.json
  def show
    @interest = Interest.find(params[:id])
  end

  def update_all_answers
    #@interests = Interest.all
    #@interest.update(interest_params)
    # Rails.logger.error("bos")
    # Rails.logger.error("#{interest_params.inspect}")

    # interest_params.key.each do |id|
      
    #   @interest = Interest.find(params[:answer])
    #   @interest.update(interest_params)
    # end
    

    # @interests.each do |interest|
    #   interest.update!(answer: 1)
    # end
    
    (1..82).each do |n|
      new_answer=''
     new_answer = params[n.to_s]
     if new_answer.to_i > 0
      logger.error("#{new_answer}")
      Interest.where(:id => n).update_all(:answer => new_answer.to_i)
    end
     #@interest = Interest.find(n+1)
     #@interest.update(answer: new_answer)
    end
    redirect_to interests_url
  end

  # GET /interests/new
  def new
    @interest = Interest.all
  end

  def edit_all
    @interests = Interest.all
  end 

  # GET /interests/1/edit
  def edit
    #@interest = Interest.find(params[:id])
    #@interest = Interest.update(interest_params)
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
    #@interest = Interest.find(params[:id])
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
      @interest = Interest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interest_params
      #logger.error("#{params.inspect}")
      #params.permit(:question, :answer, :id)
      params.fetch(:interest, {})
      logger.error("#{params.inspect}")
    end
end
