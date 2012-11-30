require 'spec_helper'

describe SuperHash do
  let(:attributes) {
    { 'test' =>
      { 'x' => 7,
        'yellow' => [{'b' => 'hello'}, {'c' => 'onetwo'}]
      }
    }
  }

  describe 'acts like a struct' do
    subject { SuperHash.new(attributes) }

    its('test.x') { should eq 7 }

    context 'with nesting' do
      its('test.yellow') { should eq attributes['test']['yellow'] }
      its('test.yellow.first.b') { should eq 'hello' }
    end
  end

  describe 'acts like a hash' do
    let(:hash) { SuperHash.new(attributes) }

    subject { hash }
    its([:test]) { should eq attributes['test'] }

    context 'with nesting' do
      subject { hash[:test] }
      its([:x]) { should eq 7 }
    end
  end

  describe 'supports mixing #[] and attributes' do
    subject { SuperHash.new(attributes).test[:yellow].first[:b] }
    it { should eq 'hello' }
  end

  describe '#to_json' do
    subject { SuperHash.new(attributes).to_json }
    it { should be_json_eql(attributes.to_json) }
  end
end