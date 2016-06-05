class RecordsController < OpenReadController
  before_action :set_record, only: [:show, :update, :destroy]

  # GET /records
  # GET /records.json
  def index
    @records = Record.all
    # @records = Record.all

    render json: @records
  end

  # GET /records/1
  # GET /records/1.json
  def show
    render json: Record.find(params[:id])
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(record_params)
    @record.user_id = current_user.id
    # @record = Record.new(record_params)

    if @record.save
      render json: @record, status: :created, location: @record
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    @record = Record.find(params[:id])

    if @record.update(record_params)
      head :no_content
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy

    head :no_content
  end

  private

    def set_record
      @record = Record.find(params[:id])
    end

    def record_params
      params.require(:record).permit(:symptom, :date, :user_id, :details)
    end
end
