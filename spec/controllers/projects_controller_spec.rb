require 'rails_helper'

describe ProjectsController do
	let(:project){FactoryGirl.create(:project)}
	let(:project_params){{"project"=>{"id"=>0,"title"=>"tester", "tags"=>"test, testing,tested", "details"=>"tes", "description" => "testing"}}}


	context "Project" do

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
				post :create, project_params
				expect(response).to redirect_to manage_blogs_url
			end

			it "redirects to the index page after auth failure" do 
				@request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("NOT:CORRECT")
				post :create, project_params
				expect(response).to redirect_to root_path
			end

			it "has a 302 status code" do
	      post :create, project_params
	      expect(response.status).to eq(302)
	    end

	    it "creates a new blog" do
	    	expect{ 
	    	post :create, project_params
	    	}.to change(Blog,:count).by(1)
	    end

		end
	end
end