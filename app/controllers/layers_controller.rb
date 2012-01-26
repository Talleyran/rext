class LayersController < ApplicationController
  respond_to :html, :json #, only: :index , except: [:show, :edit]
 

  # GET /layers
  # GET /layers.json
  def index
    respond_with @layers = Layer.all( order: :created_at )
  end

  # GET /layers/1
  # GET /layers/1.json
  def show
    respond_with @layer = Layer.find(params[:id])
  end

  # GET /layers/new
  # GET /layers/new.json
  def new
    respond_with @layer = Layer.new
  end

  # GET /layers/1/edit
  def edit
    respond_with @layer = Layer.find(params[:id])
  end

  # POST /layers
  # POST /layers.json
  def create
    respond_with @layer = Layer.create( params[:layer] )
  end

  # PUT /layers/1
  # PUT /layers/1.json
  def update
    @layer = Layer.find params[:id]
    @layer.update_attributes params[:layer]
    respond_with(@layer) do |format|
      format.json {
        if @layer.valid?
          render json: @layer
        else
          render json: @layer.errors, status: :unprocessable_entity
        end
      }
    end

  end

  # DELETE /layers/1
  # DELETE /layers/1.json
  def destroy
    respond_with Layer.find(params[:id]).destroy, :location => layers_url
  end
end
