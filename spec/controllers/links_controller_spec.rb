require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  describe 'GET index' do
    it 'assigns @links' do
      link = create(:link)
      get :index
      expect(assigns(:top_links)).to eq([link])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST create' do
    it 'responds to html by default' do
      post :create, :params => {"link" => { "given_url" => "http://www.google.com"}}
      expect(response.content_type).to eq 'text/html'
    end

    it 'should generate shortened url' do
      post :create, :params => {"link" => { "given_url" => "http://www.google.com"}}
      expect(assigns(:link).clicks).to eq(1)
      expect(assigns(:link).given_url).to eq('http://www.google.com')

    end

    it "responds to custom formats when provided in the params" do
         post :create, :params => {"link" => { "given_url" => "http://www.google.com"}}, :format => :js
         expect(response.content_type).to eq "text/javascript"
    end

    it 'on success redirect to root' do
      post :create, :params => {"link" => { "given_url" => "http://www.google.com"}}
      expect(response).to redirect_to(root_path)
    end

    it 'on success show flash notice' do
      post :create, :params => {"link" => { "given_url" => "http://www.google.com"}}
      expect(flash[:notice]).to be_present
      expect(flash[:notice]).to eq('Link was successfully created.')
    end
  end

  describe 'GET show' do
    it 'should show url info using slug' do
      link = create(:link)
      get :show, :params => {"slug" => link.slug}
      expect(assigns(:link).clicks).to eq(2)
    end
  end
end
