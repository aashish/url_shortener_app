# links controller
class LinksController < ApplicationController
  before_action :set_link, only: [:show]

  def index
    @link = Link.new
    @top_links = Link.order(created_at: :desc).page params[:page]
  end

  def show
    if params[:slug]
      set_lat_lng
      @link = Link.find_by(slug: params[:slug])
      @link.statistics.build(:latitude => @lat, :longitude => @lng, :ip => request.remote_ip, :requested_at => DateTime.now, :request_from => browser.name )
      if redirect_to @link.given_url
        @link.clicks += 1
        @link.save
      end
    else
      @link = Link.find(params[:id])
    end
  end

  def stats
    @link = Link.where(slug: params[:id])
    render :json => @link.to_json(:include => :statistics)
  end

  def create
    @link = Link.new(link_params)
    @link.clicks = 1
    respond_to do |format|
      if @link.save
        format.html do
          redirect_to root_path, notice: 'Link was successfully created.'
        end
        format.js
        format.json { render action: 'show', status: :created, location: @link }
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_link
    @link = Link.find_by(slug: params[:slug])
  end

  def link_params
    params.require(:link).permit(:given_url)
  end

  def set_lat_lng
    if !(params['latitude'].blank? || params['longitude'].blank?)
      @lat = params['latitude'].to_f
      @lng = params['longitude'].to_f
    else
      begin
        geo = Geokit::Geocoders::MultiGeocoder.geocode(request.remote_ip)
        @lat =  geo.lat
        @lng =  geo.lng
      rescue StandardError
      end
    end
  end
end
