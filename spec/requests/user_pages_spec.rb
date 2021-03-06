require 'spec_helper'
describe "UserPages" do
	subject {page}
  describe "signup page" do
  	before {visit "/signup"}
  	it { should have_selector("h1", text:"Sign up") }
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers

  end
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end
end
