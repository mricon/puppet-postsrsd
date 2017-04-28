require 'spec_helper'

describe 'postsrsd', :type => 'class'  do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { should compile }
      it { should contain_class('postsrsd::install') }
      it { should contain_package('postsrsdtest')
          .with_ensure('present')
      }
    end
  end
end
