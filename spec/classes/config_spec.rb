require 'spec_helper'

describe 'postsrsd', :type => 'class'  do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { should compile }
      it { should contain_class('postsrsd::config') }
      it { should contain_file('/etc/sysconfig/postsrsdtest')
          .with_ensure('present')
          .with_owner('root')
          .with_group('root')
          .with_mode('0600')
          .with_content(/^SRS_DOMAIN=example.com/)
          .with_content(/^SRS_EXCLUDE_DOMAINS=example.net,example.org/)
          .with_content(/^SRS_SEPARATOR=-/)
          .with_content(/^SRS_SECRET=\/etc\/postsrsdtest.secret/)
          .with_content(/^SRS_HASHLENGTH=5/)
          .with_content(/^SRS_HASHMIN=3/)
          .with_content(/^SRS_FORWARD_PORT=20001/)
          .with_content(/^SRS_REVERSE_PORT=20002/)
          .with_content(/^RUN_AS=postsrsd/)
      }
      it { should contain_file('/etc/postsrsdtest.secret')
          .with_ensure('present')
          .with_owner('root')
          .with_group('root')
          .with_mode('0600')
          .with_content(/^bogusbogus/)
      }
    end
  end
end
