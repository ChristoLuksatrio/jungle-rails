require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    User.new(name: "Anything",
            email: "test@testy.com",
            password: "Qwert!",
            password_confirmation: "Qwert!")
  }

  before do
    @user = User.new(name: "test",
                    email: "newtest@test.com",
                    password: "Qwert!",
                    password_confirmation: "Qwert!")
  end

  describe 'Validations' do
    it "must have matching password and password_confirmation fields" do
      subject.password = "Qwert!"
      subject.password_confirmation = "Qwert!!!!!"
      expect(subject).to_not be_valid
    end

    # it "must have a unique email" do
    #   subject.email = "test@test.com"
    #   subject.save
    #   expect(subject.save).to redirect_to('/signup')
    # end

    it "must have a unique email" do 
      is_expected.to validate_uniqueness_of :email 
    end

    it "is not valid without email and name" do
      subject.name = nil
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password below" do
      subject.password = "1"
      subject.password_confirmation = "1"
      expect(subject).to_not be_valid
    end
  end
end
