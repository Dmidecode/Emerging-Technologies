require 'spec_helper'

describe User do

 before(:each) do
 	@attr = {
      :name => "User Example",
      :email => "user@example.com",
      :password => "toto42",
      :password_confirmation => "toto42"
    }
  end

  it "Must put a name and, e-mail, a password and a password confirmation to valid the user" do
    User.create!(@attr)
  end

  it "must require a name" do   
    bad_guy = User.new(@attr.merge(:name => ""))
    bad_guy.should_not be_valid
  end

  it "must require an email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "reject name too long" do
    long_name = "a" * 51
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end

  it "Must accept valid email address" do
    adresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    adresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "must reject a invalid email address" do
    adresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    adresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "reject a duplicate email" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "must reject an invalid email address invariant" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  describe "password validations" do

    it "must expect a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "Must expect a confirmation of the password" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "reject too short password" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

    it "reject too long password" do
      long = "a" * 41
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end
  end

  describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "must have an ecrypted password" do
      @user.should respond_to(:encrypted_password)
    end

        it "define the encrypted password" do
      @user.encrypted_password.should_not be_blank
    end


	describe "Method has_password?" do

      it "must return true if password are equals" do
        @user.has_password?(@attr[:password]).should be_true
      end    

      it "must return false if password are not the same" do
        @user.has_password?("invalid").should be_false
      end 
    end


	describe "authenticate method" do

      it "if bad password param must return nil" do
        wrong_password_user = User.authenticate(@attr[:email], "wrongpass")
        wrong_password_user.should be_nil
      end

      it "if bad email must return nil" do
        nonexistent_user = User.authenticate("bar@foo.com", @attr[:password])
        nonexistent_user.should be_nil
      end

      it "must return the user if email + password are good" do
        matching_user = User.authenticate(@attr[:email], @attr[:password])
        matching_user.should == @user
      end

	end
	
  end # Describe Password encryption

  describe "Sharing with micropost" do

    before(:each) do
      @user = User.create(@attr)
      @mp1 = Factory(:micropost, :user => @user, :created_at => 1.day.ago)
      @mp2 = Factory(:micropost, :user => @user, :created_at => 1.hour.ago)
    end

    it "must have a 'micropost' attribut" do
      @user.should respond_to(:microposts)
    end

    it "must have the microposts in the right order" do
      @user.microposts.should == [@mp2, @mp1]
    end

    it "must destruct the user and his microposts" do
      @user.destroy
      [@mp1, @mp2].each do |micropost|
        Micropost.find_by_id(micropost.id).should be_nil
      end
    end

  end # Sharing With micropost

end
