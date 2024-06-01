require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/comments", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Comment. As you add validations to Comment, be sure to
  # adjust the attributes here as well.
  let!(:story) {
    Story.create!
  }

  let(:valid_attributes) {
    {
      body: 'valid message',
      story_id: story.id
    }
  }

  let(:invalid_attributes) {
    {
      body: 'invalid',
      story_id: story.id
    }
  }

  describe "GET stoories/show" do
    it "renders a successful response" do
      Comment.create!(valid_attributes)
      get story_url(id: story.id)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Comment" do
        expect {
          post story_comments_url(story), params: { comment: valid_attributes }
        }.to change(Comment, :count).by(1)
      end

      it "redirects to the created story of comment" do
        post story_comments_url(story), params: { comment: valid_attributes }
        expect(response).to redirect_to(story_url(id: story.id))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Comment" do
        expect {
          post story_comments_url(story), params: { comment: invalid_attributes }
        }.to change(Comment, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post story_comments_url(story), params: { comment: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { body: 'updated valid comment' }
      }

      it "updates the requested comment" do
        comment = Comment.create! valid_attributes
        patch story_comment_url(story, comment), params: { comment: new_attributes }
        comment.reload
        expect(comment.body).to eq(new_attributes[:body])
      end

      it "redirects to the story" do
        comment = Comment.create! valid_attributes
        patch story_comment_url(story, comment), params: { comment: new_attributes }
        comment.reload
        expect(response).to redirect_to(story_url(id: story.id))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        comment = Comment.create! valid_attributes
        patch story_comment_url(story, comment), params: { comment: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested comment" do
      comment = Comment.create! valid_attributes
      expect {
        delete story_comment_url(story, comment)
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      comment = Comment.create! valid_attributes
      delete story_comment_url(story, comment)
      expect(response).to redirect_to(story_url(id: story.id))
    end
  end
end
