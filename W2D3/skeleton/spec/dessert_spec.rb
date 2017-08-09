require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :name => "cory", :titleize => "Cory") }
  subject(:apple_pie) do
    Dessert.new("pie", 8, chef)
  end
  let(:bad_apple_pie) { Dessert.new("pie", "hammer", :chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(subject.type).to eq("pie")
    end

    it "sets a quantity" do
      expect(subject.quantity).to eq(8)
    end

    it "starts ingredients as an empty array" do
      expect(subject.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { bad_apple_pie.quantity }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do
      subject.add_ingredient("sugar")
    end

    it "adds an ingredient to the ingredients array" do
      expect(subject.ingredients).to include("sugar")
    end
  end

  describe "#mix!" do
    before(:each) do
      subject.add_ingredient("sugar")
      subject.add_ingredient("milk")
      subject.add_ingredient("apple")
      subject.mix!
    end
    it "shuffles the ingredient array" do
      expect(subject.ingredients).to_not eq(["sugar", "milk", "apple"])
    end
  end

  describe "#eat" do
    let(:small_portion) { Dessert.new("pie", 1, chef)}
    before(:each) do
      subject.eat(2)
    end
    it "subtracts an amount from the quantity" do
      expect(subject.quantity).to eq(6)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { small_portion.eat(2) }.to raise_error(RuntimeError)
    end

  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(subject.serve).to include("Cory")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(subject)
      subject.make_more
    end
  end
end
