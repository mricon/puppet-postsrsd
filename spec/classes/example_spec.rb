require 'spec_helper'

describe 'postsrsd' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "postsrsd class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('postsrsd::params') }
          it { is_expected.to contain_class('postsrsd::install').that_comes_before('postsrsd::config') }
          it { is_expected.to contain_class('postsrsd::config') }
          it { is_expected.to contain_class('postsrsd::service').that_subscribes_to('postsrsd::config') }

          it { is_expected.to contain_service('postsrsd') }
          it { is_expected.to contain_package('postsrsd').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'postsrsd class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('postsrsd') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
