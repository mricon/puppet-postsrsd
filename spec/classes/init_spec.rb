require 'spec_helper'

describe 'postsrsd', :type => 'class'  do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { should compile }
      it { should contain_anchor('postsrsd::begin') }
      it { should contain_class('postsrsd::install') }
      it { should contain_class('postsrsd::config') }
      it { should contain_class('postsrsd::service') }
      it { should contain_class('postsrsd') }
      it { should contain_anchor('postsrsd::end') }
    end
  end
end
