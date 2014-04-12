require 'spec_helper'

describe DestroyAssociates::MixinARBase do
  create_temp_table(:users){}
  create_temp_table(:mails) do |t|
    t.references :user
    t.string :address
  end

  before :all do
    class User < ActiveRecord::Base
      has_many :mails
      accepts_nested_attributes_for :mails
      destroy_associates_if_blank :mails, :address
    end

    class Mail < ActiveRecord::Base
      belongs_to :user
    end
  end

  describe "ClassMethods" do
    let(:user){ User.create! }

    before do
      user.mails.create!(address: "alice@sample.inc")
    end

    describe ".destroy_associates_if_blank" do
      context "attribute value is blank" do
        it "destroys associate" do
          user.mails.first.address = ""
          expect{
            user.save!
          }.to change(user.mails, :count).by(-1)
        end
      end

      context "attribute value is not blank" do
        it "nothing to do" do
          user.mails.first.address = "bob@sample.inc"
          expect{
            user.save!
          }.not_to change(user.mails, :count)
        end
      end
    end
  end
end
