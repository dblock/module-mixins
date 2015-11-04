require 'spec_helper'

describe Module::Mixins do
  it 'has a version' do
    expect(Module::Mixins::VERSION.split('.').size).to eq 3
  end
end
