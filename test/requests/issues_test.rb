require_relative '../test_helper'

describe Kobol::Requests::Issues do
  let(:issues) { Kobol::Requests::Issues.new }

  before do
    Kobol::Requests::Issues.send(:public, :search_params)
  end

  it "#search_params" do
    properties = { label: ["bug", "refactoring"], language: ["ruby"] }
    processed_properties = %{label:"bug" label:"refactoring" language:"ruby"}

    issues.search_params(properties).must_equal(processed_properties)
  end
end
