require 'rails_helper'

RSpec.describe Campaign, type: :model do
  # We're using 'describe' in here to define a group of test examples for model validations.
  describe "validations" do
  # DSL = special syntax
  # use 'it' or 'specify' to define a test example (DSL). The first argument to 'it' is a string that describes what you want to test. You write your test within a block you pass to the 'it'.
    it "requires a title" do
      # GIVEN: campaign with no title
      c = Campaign.new
      # WHEN: we validate the campaign
      validation_outcome = c.valid?
      # THEN: validation_outcome is false (thus add "validates :title, presence: true" to campaign.rb)
      expect(validation_outcome).to eq(false)
    end

    it "requires a goal" do
      # GIVEN: campaign with no goal
      c = Campaign.new
      # WHEN: we validate the campaign
      c.valid?
      # puts ">>>>>>>> #{c.errors.inspect}"
      # THEN: there is an error on :goal (thus add "validates :goal, presence: true" to campaign.rb)
      expect(c.errors).to have_key(:goal)
    end

    it "requires the goal to be more than $10" do
      c = Campaign.new(goal: 9)
      c.valid?
      expect(c.errors).to have_key(:goal)
    end

    it "requires a unique title" do
      # c = Campaign.new title: "Hello", goal: 11
      # c.save
      Campaign.create title: "Hello", goal: 11
      c1 = Campaign.new title: "Hello", goal: 11

      c1.valid?

      expect(c1.errors).to have_key :title
    end
  end

  # it's a convention to put the method named prefixed with a '.' if you're testing a method (in the describe)
  describe ".upcased_title" do
    it "returns an upcased title" do
      # GIVEN:
      c = Campaign.new title: "hello", goal: 11
      # WHEN:
      result = c.upcased_title
      # THEN:
      expect(result).to eq("HELLO")


    end
  end
end
