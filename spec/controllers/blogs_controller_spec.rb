require 'rails_helper'

describe BlogsController do
	let(:blog){Blog.new(title: 'tested', body: 'testing', tags: 'test, testing, tester')}
	let(:blog_params){{"blog"=>{"title"=>"test", "tags"=>"test", "created_at"=>"", "body"=>"tes"}}}

	context "GET #index" do
		it "should render index template" do
			get :index
      expect(response).to render_template("index")
		end

		it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
	end

	context "POST #create" do
		before do
  		@request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{ENV['PF_NAME']}:#{ENV['PF_PASSWORD']}")
		end

		it "redirects to the blog managment page upon successful save" do 
			post :create, blog_params
			expect(response).to redirect_to manage_blogs_path
		end

		it "redirects to the index page after auth failure" do 
			@request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("NOT:CORRECT")
			post :create, blog_params
			expect(response).to redirect_to root_path
		end

		it "has a 302 status code" do
      post :create, blog_params
      expect(response.status).to eq(302)
    end

	end
end