require 'rails_helper'

describe BlogsController do
	let(:blog){FactoryGirl.create(:blog)}
	let(:blog_params){{"blog"=>{"id"=>0,"title"=>"tester", "tags"=>"test, testing,tested", "created_at"=>"", "body"=>"tes"}}}

	context "Blog" do

		context "GET #get_markdown_text" do

		end

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
				expect(response).to redirect_to manage_blogs_url
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

	    it "creates a new blog" do
	    	expect{ 
	    	post :create, blog_params
	    	}.to change(Blog,:count).by(1)
	    end

		end

		context "GET #new" do

		end

		context "GET #edit" do

		end

		context "GET #show" do

		end

		context "PUT #update" do

		end

		context "DELETE #destroy" do
			before do
	  		@request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{ENV['PF_NAME']}:#{ENV['PF_PASSWORD']}")
			end

			it "deletes the blog" do 
				# expect{ 
				# 	delete :destroy, id: blog.id
				# }.to change(Blog,:count).by(1)
			end 

			it "redirects incorrect user" do 
				@request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("NOT:#{ENV['PF_PASSWORD']}")
				delete :destroy, id: blog.id
				expect(response).to redirect_to root_url 
			end

			it "redirects incorrect password" do 
				@request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{ENV['PF_NAME']}:NOT")
				delete :destroy, id: blog.id
				expect(response).to redirect_to root_url 
			end

			it "redirects successful delete" do
				delete :destroy, id: blog.id
				expect(response).to redirect_to manage_blogs_url 
			end

		end

	end
	
end