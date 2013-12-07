require 'spec_helper'

describe Invoice do
  it { should respond_to :expenses }
  it { should respond_to :client }
  it { should_not respond_to :user}
end
