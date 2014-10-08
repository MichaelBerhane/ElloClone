require 'spec_helper'

describe "Static pages" do


  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_title("ElloClone") }
    it { should_not have_title("| Home") }
    end

  describe "Help page" do
    before { visit help_path }

    it { should have_title("ElloClone | Help")}
    it { should have_content("Help")}
  end

  describe "About page" do

    before {visit about_path}

    it{ should have_content('About Us')}
    it{ should have_title("ElloClone | About Us")}
  end

  describe "Contact page" do

      before {visit contact_path}
      
      it {should have_title("ElloClone | Contact")}
      it {should have_content("Contact")}
  end


end
