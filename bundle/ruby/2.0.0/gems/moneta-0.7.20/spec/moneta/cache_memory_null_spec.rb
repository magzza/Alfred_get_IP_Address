# coding: binary
# Generated by generate-specs
require 'helper'

describe_moneta "cache_memory_null" do
  def features
    [:create, :increment]
  end

  def new_store
    Moneta.build do
      use(:Cache) do
        adapter(Moneta::Adapters::Memory.new)
        cache(Moneta::Adapters::Null.new)
      end
    end
  end

  def load_value(value)
    Marshal.load(value)
  end

  include_context 'setup_store'
  it_should_behave_like 'create'
  it_should_behave_like 'features'
  it_should_behave_like 'increment'
  it_should_behave_like 'not_persist'
  it_should_behave_like 'null_stringkey_stringvalue'
  it_should_behave_like 'null_pathkey_stringvalue'
  it_should_behave_like 'returnsame_stringkey_stringvalue'
  it_should_behave_like 'returnsame_pathkey_stringvalue'
  it_should_behave_like 'store_stringkey_stringvalue'
  it_should_behave_like 'store_pathkey_stringvalue'
  it_should_behave_like 'store_large'
end